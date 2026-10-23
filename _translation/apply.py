#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Apply Chinese->Thai mapping files produced by the translation agents.

Three jobs:
  1. install/sql.sql : menu_title column, config_title / config_remark columns
  2. upgrade SQL     : UPDATE statements so existing sites get the same text
  3. templates       : only text nodes, never tags / attributes / scripts / PHP
"""
import io
import os
import re
import sys

ROOT = r'D:\Github\wmcms-th'
PACK = os.path.join(ROOT, 'V4.446.1257')
IN = os.path.join(ROOT, '_translation', 'in')
OUT = os.path.join(ROOT, '_translation', 'out')

CJK = re.compile(r'[\u4e00-\u9fff]')


def load_tsv(name, expect=None):
    path = os.path.join(OUT, name)
    mapping = {}
    order = []
    with io.open(path, encoding='utf-8') as fh:
        for ln, line in enumerate(fh, 1):
            line = line.rstrip('\n').rstrip('\r')
            if not line.strip():
                continue
            if '\t' not in line:
                raise SystemExit('%s:%d has no TAB: %r' % (name, ln, line[:60]))
            src, dst = line.split('\t', 1)
            mapping[src.strip()] = dst.strip()
            order.append(src.strip())
    if expect is not None and len(mapping) != expect:
        print('  note: %s has %d entries (expected %d)' % (name, len(mapping), expect))
    return mapping


def load_all_tsv(prefix, count):
    merged = {}
    for i in range(1, count + 1):
        merged.update(load_tsv('%s_%d.tsv' % (prefix, i)))
    return merged


# ---------------------------------------------------------------- SQL parsing
def split_tuples(body):
    """Split "a),(b)" style VALUES body into a list of raw tuple strings."""
    rows = []
    depth = 0
    cur = ''
    inq = False
    esc = False
    for ch in body:
        if esc:
            cur += ch
            esc = False
            continue
        if ch == '\\':
            cur += ch
            esc = True
            continue
        if ch == "'":
            inq = not inq
            cur += ch
            continue
        if not inq:
            if ch == '(':
                if depth == 0:
                    cur = ''
                else:
                    cur += ch
                depth += 1
                continue
            if ch == ')':
                depth -= 1
                if depth == 0:
                    rows.append(cur)
                    cur = ''
                else:
                    cur += ch
                continue
            if ch == ';' and depth == 0:
                break
        if depth > 0:
            cur += ch
    return rows


def split_fields(row):
    fields = []
    cur = ''
    inq = False
    esc = False
    for ch in row:
        if esc:
            cur += ch
            esc = False
            continue
        if ch == '\\':
            cur += ch
            esc = True
            continue
        if ch == "'":
            inq = not inq
            cur += ch
            continue
        if ch == ',' and not inq:
            fields.append(cur)
            cur = ''
            continue
        cur += ch
    fields.append(cur)
    return fields


def quote(val):
    return "'" + val.replace('\\', '\\\\').replace("'", "\\'") + "'"


def unquote(field):
    field = field.strip()
    if len(field) >= 2 and field[0] == "'" and field[-1] == "'":
        return field[1:-1].replace("\\'", "'").replace('\\\\', '\\')
    return field


def rewrite_insert(sql, table, replacements):
    """replacements: {column index: mapping}. Returns (new_sql, applied, missed)."""
    pat = re.compile(r'(insert\s+into\s+`' + table + r'`\s*values\s*)(.*?)(;\r?\n)', re.S | re.I)
    m = pat.search(sql)
    if not m:
        raise SystemExit('insert for %s not found' % table)
    rows = split_tuples(m.group(2))
    applied = 0
    missed = []
    lines = []
    for row in rows:
        fields = split_fields(row)
        changed = list(fields)
        for idx, mapping in replacements.items():
            raw = fields[idx]
            val = unquote(raw)
            if CJK.search(val):
                if val in mapping:
                    changed[idx] = quote(mapping[val])
                    applied += 1
                else:
                    missed.append(val)
        lines.append('(' + ','.join(changed) + ')')
    new_body = ','.join(lines)
    return sql[:m.start(2)] + new_body + sql[m.end(2):], applied, missed


def rows_of(sql, table, indexes):
    pat = re.compile(r'(insert\s+into\s+`' + table + r'`\s*values\s*)(.*?)(;\r?\n)', re.S | re.I)
    m = pat.search(sql)
    out = []
    for row in split_tuples(m.group(2)):
        fields = split_fields(row)
        out.append([unquote(fields[i]) for i in indexes])
    return out


def build_upgrade(sql, menu_map, title_map, remark_map):
    menu_rows = rows_of(sql, 'wm_system_menu', [0, 2])
    cfg_rows = rows_of(sql, 'wm_config_config', [0, 4, 8])
    out = ["""-- WMCMS V4.446.1257 - Thai language pack
-- Run once on an existing install after deploying the new files.
-- Fresh installs already contain these strings in install/sql.sql.

SET NAMES utf8mb4;
"""]
    n = 0
    for mid, title in menu_rows:
        if CJK.search(title) and title in menu_map:
            out.append("UPDATE `wm_system_menu` SET `menu_title`=%s WHERE `menu_id`=%s;"
                       % (quote(menu_map[title]), mid))
            n += 1
    out.append('\n-- admin settings screen labels')
    m = 0
    for cid, title, remark in cfg_rows:
        sets = []
        if CJK.search(title) and title in title_map:
            sets.append('`config_title`=' + quote(title_map[title]))
        if CJK.search(remark) and remark in remark_map:
            sets.append('`config_remark`=' + quote(remark_map[remark]))
        if sets:
            out.append("UPDATE `wm_config_config` SET %s WHERE `config_id`=%s;"
                       % (', '.join(sets), cid))
            m += 1
    out.append('\n-- menu rows updated: %d, settings rows updated: %d\n' % (n, m))
    return ''.join(out), n, m


# ------------------------------------------------------------------ templates
def text_nodes(html):
    """Yield (start, end) spans of text nodes we are allowed to touch."""
    i = 0
    n = len(html)
    spans = []
    opaque = []
    # mark script/style/php regions as opaque
    for pat in (r'<script\b.*?</script\s*>', r'<style\b.*?</style\s*>', r'<\?php.*?\?>', r'<!--.*?-->'):
        for m in re.finditer(pat, html, re.S | re.I):
            opaque.append((m.start(), m.end()))
    opaque.sort()

    def inside_opaque(pos):
        for a, b in opaque:
            if a <= pos < b:
                return True
            if a > pos:
                break
        return False

    for m in re.finditer(r'>([^<]+)<', html):
        s, e = m.start(1), m.end(1)
        if inside_opaque(s):
            continue
        spans.append((s, e))
    return spans


def apply_templates(mapping):
    changed_files = 0
    replaced = 0
    leftovers = 0
    for theme in ('wmcms-web', 'wmcms-m'):
        base = os.path.join(PACK, 'templates', theme)
        for dirpath, _dirs, files in os.walk(base):
            for name in files:
                if not name.endswith('.html'):
                    continue
                path = os.path.join(dirpath, name)
                with io.open(path, encoding='utf-8') as fh:
                    html = fh.read()
                spans = text_nodes(html)
                pieces = []
                last = 0
                local = 0
                for s, e in spans:
                    raw = html[s:e]
                    stripped = raw.strip()
                    if not stripped:
                        continue
                    key = re.sub(r'\s+', ' ', stripped)
                    if key in mapping:
                        thai = mapping[key]
                        lead = raw[:len(raw) - len(raw.lstrip())]
                        trail = raw[len(raw.rstrip()):]
                        pieces.append(html[last:s])
                        pieces.append(lead + thai + trail)
                        last = e
                        local += 1
                    elif CJK.search(stripped):
                        leftovers += 1
                if local:
                    pieces.append(html[last:])
                    new = ''.join(pieces)
                    with io.open(path, 'w', encoding='utf-8', newline='') as fh:
                        fh.write(new)
                    changed_files += 1
                    replaced += local
    return changed_files, replaced, leftovers


def main():
    which = sys.argv[1] if len(sys.argv) > 1 else 'all'
    sql_path = os.path.join(PACK, 'install', 'sql.sql')
    with io.open(sql_path, encoding='utf-8', newline='') as fh:
        sql = fh.read()

    menu_map = {}
    title_map = {}
    remark_map = {}
    if which in ('all', 'sql'):
        menu_map = {}
        menu_map.update(load_tsv('menu_a.tsv'))
        menu_map.update(load_tsv('menu_b.tsv'))
        title_map = load_tsv('config_titles.tsv')
        remark_map = load_tsv('config_remarks.tsv')
        sql, a1, miss1 = rewrite_insert(sql, 'wm_system_menu', {2: menu_map})
        sql, a2, miss2 = rewrite_insert(sql, 'wm_config_config', {4: title_map, 8: remark_map})
        with io.open(sql_path, 'w', encoding='utf-8', newline='') as fh:
            fh.write(sql)
        print('sql.sql: menu replaced %d (missed %d), config replaced %d (missed %d)'
              % (a1, len(miss1), a2, len(miss2)))
        if miss1:
            print('  missing menu strings:', miss1[:10])
        if miss2:
            print('  missing config strings:', miss2[:10])

        upgrade, n1, n2 = build_upgrade(sql, menu_map, title_map, remark_map)
        up_path = os.path.join(PACK, 'upgrade', 'V4.446.1257-ThaiLanguage.sql')
        with io.open(up_path, 'w', encoding='utf-8', newline='\n') as fh:
            fh.write(upgrade)
        print('upgrade SQL: %d menu + %d config rows -> %s' % (n1, n2, up_path))

    if which in ('all', 'tpl'):
        mapping = {}
        for i in (1, 2, 3):
            mapping.update(load_tsv('tpl_%d.tsv' % i))
        cf, rp, lo = apply_templates(mapping)
        print('templates: %d files changed, %d nodes replaced, %d chinese nodes left unmapped'
              % (cf, rp, lo))


if __name__ == '__main__':
    main()
