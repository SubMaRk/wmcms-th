#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Apply admin-template Thai translations (visible text nodes only)."""
import io
import os
import re

PACK = r'D:\Github\wmcms-th\V4.446.1257'
OUT = r'D:\Github\wmcms-th\_translation\out'
CJK = re.compile(r'[\u4e00-\u9fff]')


def load(*names):
    m = {}
    for n in names:
        p = os.path.join(OUT, n)
        if not os.path.exists(p):
            continue
        for line in io.open(p, encoding='utf-8'):
            if '\t' not in line:
                continue
            a, b = line.rstrip('\r\n').split('\t', 1)
            m[a.strip()] = b.strip()
    return m


def main():
    mapping = load('adm_1.tsv', 'adm_2.tsv', 'adm_3.tsv')
    print('admin mappings:', len(mapping))
    changed = files = 0
    for dirpath, _d, fs in os.walk(os.path.join(PACK, 'admin', 'templates')):
        for f in fs:
            if not f.endswith('.php'):
                continue
            path = os.path.join(dirpath, f)
            src = io.open(path, encoding='utf-8', errors='replace').read()
            # opaque regions: script / style / php / comments
            masks = []
            for pat in (r'<script\b.*?</script\s*>', r'<style\b.*?</style\s*>',
                        r'<\?php.*?\?>', r'<!--.*?-->'):
                for m in re.finditer(pat, src, re.S | re.I):
                    masks.append((m.start(), m.end()))

            def opaque(pos):
                for a, b in masks:
                    if a <= pos < b:
                        return True
                    if a > pos:
                        break
                return False

            out = []
            last = 0
            local = 0
            for m in re.finditer(r'>([^<]+)<', src):
                s, e = m.start(1), m.end(1)
                if opaque(s):
                    continue
                raw = src[s:e]
                key = re.sub(r'\s+', ' ', raw.strip())
                if key in mapping:
                    thai = mapping[key]
                    lead = raw[:len(raw) - len(raw.lstrip())]
                    trail = raw[len(raw.rstrip()):]
                    out.append(src[last:s])
                    out.append(lead + thai + trail)
                    last = e
                    local += 1
            if local:
                out.append(src[last:])
                io.open(path, 'w', encoding='utf-8', newline='').write(''.join(out))
                changed += local
                files += 1
    print('nodes replaced %d in %d files' % (changed, files))


if __name__ == '__main__':
    main()
