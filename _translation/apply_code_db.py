#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Apply Thai translations to PHP string literals and DB label rows.

Two modes:
  code : replace exact Chinese string literals in .php files (never touches
         keys, code, or anything outside quotes)
  db   : rewrite install/sql.sql label columns + emit an upgrade SQL file
"""
import io
import json
import os
import re
import sys

ROOT = r'D:\Github\wmcms-th'
PACK = os.path.join(ROOT, 'V4.446.1257')
OUT = os.path.join(ROOT, '_translation', 'out')

STR = re.compile(r"'((?:[^'\\]|\\.)*)'|\"((?:[^\"\\]|\\.)*)\"")


def load(name):
    p = os.path.join(OUT, name)
    m = {}
    if not os.path.exists(p):
        return m
    for line in io.open(p, encoding='utf-8'):
        raw = line.rstrip('\r\n')
        if '\t' not in raw:
            continue
        a, b = raw.split('\t', 1)
        m[a.strip()] = b.strip()
    return m


def apply_code(mapping):
    """Replace only values that sit in a string literal and match exactly."""
    changed = 0
    files = 0
    for root, dirs, fs in os.walk(PACK):
        n = root.replace('\\', '/')
        if any(x in n for x in ['/templates', '/lang/', '/BJUI', '/ueditor',
                                '/Mailer', '/pclzip', '/paypal', '/vendor', '/install']):
            continue
        for f in fs:
            if not f.endswith('.php'):
                continue
            p = os.path.join(root, f)
            src = io.open(p, encoding='utf-8', errors='replace').read()
            hits = [0]

            def sub(m):
                q = m.group(1) is not None and "'" or '"'
                txt = m.group(1) if m.group(1) is not None else m.group(2)
                key = txt.strip()
                if key in mapping:
                    thai = mapping[key]
                    if q in thai or '\n' in thai:
                        return m.group(0)
                    hits[0] += 1
                    return q + thai + q
                return m.group(0)

            new = STR.sub(sub, src)
            if hits[0]:
                io.open(p, 'w', encoding='utf-8', newline='').write(new)
                changed += hits[0]
                files += 1
    return changed, files


# ------------------------------------------------------------------ db tables
# table, id column, [(field index, label column), ...]
WRITE_SPEC = [
    ('wm_author_level', 'level_id', [(2, 'level_name')]),
    ('wm_author_sign', 'sign_id', [(2, 'sign_name')]),
    ('wm_system_retrieval', 'retrieval_id', [(4, 'retrieval_title')]),
    ('wm_api_type', 'type_id', [(1, 'type_title')]),
    ('wm_api_api', 'api_id', [(3, 'api_title'), (4, 'api_ctitle')]),
    ('wm_seo_urls', 'urls_id', [(3, 'urls_pagename')]),
    ('wm_novel_volume', 'volume_id', [(1, 'volume_name'), (3, 'volume_desc')]),
    ('wm_config_option', 'option_id', [(2, 'option_title'), (3, 'option_value')]),
]


def quote(v):
    return "'" + v.replace('\\', '\\\\').replace("'", "\\'") + "'"


def apply_db(mapping):
    sql_path = os.path.join(PACK, 'install', 'sql.sql')
    sql = io.open(sql_path, encoding='utf-8', newline='').read()
    upgrade = ["-- WMCMS V4.446.1257 - Thai language pack: database labels",
               "-- Run after V4.446.1257-ThaiLanguage.sql (or alone if you only need labels).",
               "", "SET NAMES utf8mb4;", ""]
    total = 0
    for table, idcol, cols in WRITE_SPEC:
        pat = re.compile(r'(insert\s+into\s+`' + table + r'`.*?values\s*)(.*?)(;\r?\n)',
                         re.S | re.I)
        m = pat.search(sql)
        if not m:
            print('  skip (no insert):', table)
            continue
        rows = split_tuples(m.group(2))
        out_rows = []
        n = 0
        for row in rows:
            fields = split_fields(row)
            rid = fields[0].strip().strip("'")
            for idx, label in cols:
                if idx >= len(fields):
                    continue
                raw = fields[idx].strip()
                if not (raw.startswith("'") and raw.endswith("'")):
                    continue
                val = raw[1:-1].replace("\\'", "'").replace('\\\\', '\\')
                if val in mapping:
                    fields[idx] = quote(mapping[val])
                    n += 1
                    upgrade.append("UPDATE `%s` SET `%s`=%s WHERE `%s`=%s;"
                                   % (table, label, quote(mapping[val]), idcol, rid))
            out_rows.append('(' + ','.join(fields) + ')')
        sql = sql[:m.start(2)] + ','.join(out_rows) + sql[m.end(2):]
        print('  %-22s %d rows' % (table, n))
        total += n
    io.open(sql_path, 'w', encoding='utf-8', newline='').write(sql)
    up = os.path.join(PACK, 'upgrade', 'V4.446.1257-ThaiLanguageLabels.sql')
    io.open(up, 'w', encoding='utf-8', newline='\n').write('\n'.join(upgrade) + '\n')
    return total, up


def split_tuples(body):
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


def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else 'all'
    if mode in ('all', 'code'):
        m = {}
        m.update(load('code_a.tsv'))
        m.update(load('code_b.tsv'))
        print('code mappings:', len(m))
        c, f = apply_code(m)
        print('php literals replaced: %d in %d files' % (c, f))
    if mode in ('all', 'db'):
        m = {}
        m.update(load('db_a.tsv'))
        m.update(load('db_b.tsv'))
        print('db mappings:', len(m))
        t, up = apply_db(m)
        print('db rows replaced: %d -> %s' % (t, up))


if __name__ == '__main__':
    main()
