#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Restore template/label placeholder names that translators renamed.

Every {...} group in the Thai side must be byte-identical to the original,
because the placeholder names are the keys used by the template engine and
by tpl::Rep()/GetLang(); renaming them silently breaks substitution.

Strategy: walk the original and the translated string in parallel and copy
back each brace group from the original. If the group counts differ, keep the
Thai text but report the line so it can be inspected by hand.
"""
import io
import os
import re
import sys

ROOT = r'D:\Github\wmcms-th'
OUT = os.path.join(ROOT, '_translation', 'out')

BR = re.compile(r'\{[^{}]*\}')


def restore(src, dst):
    """Copy brace groups from src into dst, positionally."""
    src_groups = BR.findall(src)
    dst_groups = BR.findall(dst)
    if src_groups == dst_groups:
        return dst, True
    if not src_groups:
        return dst, False
    # replace the i-th group in dst with the i-th group in src
    idx = [0]

    def sub(m):
        if idx[0] < len(src_groups):
            val = src_groups[idx[0]]
        else:
            val = m.group(0)
        idx[0] += 1
        return val

    fixed = BR.sub(sub, dst)
    ok = (idx[0] == len(src_groups) == len(dst_groups))
    return fixed, ok


def fix_tsv(path):
    bad = 0
    changed = 0
    lines = []
    with io.open(path, encoding='utf-8') as fh:
        for line in fh:
            raw = line.rstrip('\r\n')
            if '\t' not in raw:
                lines.append(raw)
                continue
            a, b = raw.split('\t', 1)
            nb, ok = restore(a, b)
            if nb != b:
                changed += 1
            if not ok:
                bad += 1
            lines.append(a + '\t' + nb)
    with io.open(path, 'w', encoding='utf-8', newline='\n') as fh:
        fh.write('\n'.join(lines) + '\n')
    return changed, bad


def fix_php_lang(path):
    """For lang packs: restore placeholders in every string value."""
    src_path = path.replace(os.sep + 'th_th' + os.sep, os.sep + 'zh_cn' + os.sep)
    if not os.path.exists(src_path):
        return 0, 0
    src = io.open(src_path, encoding='utf-8').read()
    dst = io.open(path, encoding='utf-8').read()
    # pair up the quoted string values in order
    str_pat = re.compile(r"'((?:[^'\\]|\\.)*)'")
    src_vals = str_pat.findall(src)
    dst_vals = str_pat.findall(dst)
    if len(src_vals) != len(dst_vals):
        return 0, -1
    changed = 0
    bad = 0
    out = []
    pos = 0
    for m in str_pat.finditer(dst):
        out.append(dst[pos:m.start()])
        cur = m.group(1)
        idx = len(out) // 2  # value index is tracked below instead
        out.append(m.group(0))
        pos = m.end()
    # simpler: rebuild by sequential replacement using a counter over value slots
    values = []
    i = 0
    for sv, dv in zip(src_vals, dst_vals):
        nv, ok = restore(sv, dv)
        if nv != dv:
            changed += 1
        if not ok:
            bad += 1
        values.append(nv)
    # rebuild the file: replace the n-th quoted string (including keys) in order
    def repl(m):
        nonlocal i
        token = m.group(0)
        # keys and values alternate unpredictably; match by value when possible
        for cand_i in range(i, len(values)):
            if dst_vals[cand_i] == m.group(1):
                i = cand_i + 1
                return "'" + values[cand_i] + "'"
        return token
    new = str_pat.sub(repl, dst)
    if new != dst:
        io.open(path, 'w', encoding='utf-8', newline='').write(new)
    return changed, bad


def main():
    total_changed = total_bad = 0
    for name in ('menu_a.tsv', 'menu_b.tsv', 'config_titles.tsv', 'config_remarks.tsv',
                 'tpl_1.tsv', 'tpl_2.tsv', 'tpl_3.tsv'):
        p = os.path.join(OUT, name)
        if not os.path.exists(p):
            continue
        c, b = fix_tsv(p)
        total_changed += c
        total_bad += b
        print('%-22s restored %4d lines, %d with unbalanced braces' % (name, c, b))
    print('tsv total: %d restored, %d unbalanced' % (total_changed, total_bad))


if __name__ == '__main__':
    main()
