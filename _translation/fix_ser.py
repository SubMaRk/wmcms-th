#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Rewrite Thai text inside PHP-serialized payloads with correct byte lengths.

The payload lives inside a SQL string literal, so quotes are escaped as \" .
We unescape, rewrite s:N:"..." entries, then re-escape.
"""
import io, os, re, sys

PACK = r'D:\Github\wmcms-th\V4.446.1257'
OUT = r'D:\Github\wmcms-th\_translation\out'


def load(name):
    m = {}
    path = os.path.join(OUT, name)
    if not os.path.exists(path):
        return m
    for line in io.open(path, encoding='utf-8'):
        if '\t' in line:
            a, b = line.rstrip('\r\n').split('\t', 1)
            m[a] = b
    return m


SER = re.compile(r's:(\d+):"((?:[^"\\]|\\.)*)"')


def rewrite(payload, mapping):
    n = [0]

    def sub(m):
        val = m.group(2)
        if val in mapping:
            thai = mapping[val]
            n[0] += 1
            return 's:%d:"%s"' % (len(thai.encode('utf-8')), thai)
        return m.group(0)

    return SER.sub(sub, payload), n[0]


def main():
    mapping = load('ser.tsv')
    if not mapping:
        print('no ser.tsv'); return
    sql_path = os.path.join(PACK, 'install', 'sql.sql')
    s = io.open(sql_path, encoding='utf-8', newline='').read()
    total = 0

    # find every SQL single-quoted literal that looks serialized
    def fix_lit(m):
        nonlocal total
        raw = m.group(1)
        if not raw.startswith('a:'):
            return m.group(0)
        payload = raw.replace('\\"', '"').replace("\\'", "'").replace('\\\\', '\\')
        new, n = rewrite(payload, mapping)
        if not n:
            return m.group(0)
        total += n
        esc = new.replace('\\', '\\\\').replace('"', '\\"').replace("'", "\\'")
        return "'" + esc + "'"

    s = re.sub(r"'((?:[^'\\]|\\.)*)'", fix_lit, s)
    io.open(sql_path, 'w', encoding='utf-8', newline='').write(s)
    print('serialized values rewritten:', total)


if __name__ == '__main__':
    main()
