#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Final pass: rewrite every Chinese SQL string literal in install/sql.sql.

Works at the literal level with a real single-quote scanner (honours \\' and
\\\\), so multi-line values, serialized blobs and escaped quotes are all safe.
Only literals that appear verbatim in one of the mapping files are changed.
"""
import io
import os
import re
import sys

PACK = r'D:\Github\wmcms-th\V4.446.1257'
OUT = r'D:\Github\wmcms-th\_translation\out'

CJK = re.compile(r'[\u4e00-\u9fff]')


def load(*names):
    m = {}
    for name in names:
        p = os.path.join(OUT, name)
        if not os.path.exists(p):
            continue
        for line in io.open(p, encoding='utf-8'):
            if '\t' not in line:
                continue
            a, b = line.rstrip('\r\n').split('\t', 1)
            m[a] = b
    return m


def scan_literals(s):
    """Yield (start, end, raw_inner) for every single-quoted SQL literal."""
    i = 0
    n = len(s)
    while i < n:
        if s[i] == "'":
            start = i + 1
            j = start
            while j < n:
                if s[j] == '\\':
                    j += 2
                    continue
                if s[j] == "'":
                    break
                j += 1
            yield start, j, s[start:j]
            i = j + 1
            continue
        i += 1


def unesc(raw):
    return raw.replace("\\'", "'").replace('\\"', '"').replace('\\\\', '\\')


def esc(val):
    return val.replace('\\', '\\\\').replace("'", "\\'").replace('"', '\\"')


def main():
    mapping = load('db2.tsv', 'db3.tsv', 'values.tsv', 'ser2.tsv',
                   'config_titles.tsv', 'config_remarks.tsv',
                   'ddl_1.tsv', 'ddl_2.tsv', 'ddl_3.tsv',
                   'data_1.tsv', 'data_2.tsv', 'data_3.tsv')  # rebuilt each run
    print('mapping entries:', len(mapping))
    path = os.path.join(PACK, 'install', 'sql.sql')
    s = io.open(path, encoding='utf-8', newline='').read()

    pieces = []
    last = 0
    changed = 0
    for start, end, raw in scan_literals(s):
        val = unesc(raw)
        if val not in mapping:
            continue
        thai = mapping[val]
        if not thai or thai == val or not CJK.search(val):
            continue
        pieces.append(s[last:start])
        pieces.append(esc(thai))
        last = end
        changed += 1
    pieces.append(s[last:])
    if changed:
        io.open(path, 'w', encoding='utf-8', newline='').write(''.join(pieces))
    print('literals rewritten:', changed)

    s2 = io.open(path, encoding='utf-8', newline='').read()
    left = [unesc(raw) for _a, _b, raw in scan_literals(s2) if CJK.search(unesc(raw))]
    print('literals still containing Chinese:', len(left))
    seen = set()
    for v in left:
        if v in seen:
            continue
        seen.add(v)
        print('   ', v[:90])


if __name__ == '__main__':
    main()
