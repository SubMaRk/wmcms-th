#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Apply the three leftover translation sets to the front-end themes.

- attrs.tsv   : title="" / alt="" / placeholder="" / submit-button text
- js2.tsv     : JS string literals inside <script> blocks
- visible.tsv : remaining visible text nodes

Brace groups {…} are never touched: they are copied from the original.
"""
import io
import os
import re
import sys

ROOT = r'D:\Github\wmcms-th'
PACK = os.path.join(ROOT, 'V4.446.1257')
OUT = os.path.join(ROOT, '_translation', 'out')

BR = re.compile(r'\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}')
ATTR_RE = re.compile(r'\b(title|alt|placeholder)=("([^"]*)"|\'([^\']*)\')')


def load(name):
    m = {}
    path = os.path.join(OUT, name)
    if not os.path.exists(path):
        print('  missing', name)
        return m
    with io.open(path, encoding='utf-8') as fh:
        for line in fh:
            raw = line.rstrip('\r\n')
            if '\t' not in raw:
                continue
            a, b = raw.split('\t', 1)
            m[a.strip()] = b.strip()
    return m


def keep_braces(src, dst):
    gs = BR.findall(src)
    if not gs:
        return dst
    it = iter(gs)
    return BR.sub(lambda m: next(it, m.group(0)), dst)


def collapse(s):
    return re.sub(r'\s+', ' ', s).strip()


def rewrite_file(path, attrs, jsmap, vismap, stats):
    with io.open(path, encoding='utf-8') as fh:
        html = fh.read()
    orig = html

    # 1) visible text nodes (brace aware, skipping script/style/php/comments)
    opaque = []
    for pat in (r'<script\b.*?</script\s*>', r'<style\b.*?</style\s*>',
                r'<\?php.*?\?>', r'<!--.*?-->'):
        for m in re.finditer(pat, html, re.S | re.I):
            opaque.append((m.start(), m.end()))
    opaque.sort()

    def opaque_at(pos):
        for a, b in opaque:
            if a <= pos < b:
                return True
            if a > pos:
                break
        return False

    out = []
    i = 0
    n = len(html)
    while i < n:
        j = html.find('<', i)
        if j < 0:
            out.append(html[i:])
            break
        out.append(html[i:j])
        k = j
        depth = 0
        while k < n:
            ch = html[k]
            if ch == '{':
                depth += 1
            elif ch == '}':
                depth = max(0, depth - 1)
            elif ch == '>' and depth == 0:
                break
            k += 1
        if k >= n:
            out.append(html[j:])
            break
        tag = html[j:k + 1]
        # translate visible attribute values inside this tag
        if not opaque_at(j):
            def attr_sub(m):
                name = m.group(1)
                quote = m.group(2)[0]
                val = m.group(3) if m.group(3) is not None else m.group(4)
                key = collapse(val)
                if key in attrs:
                    thai = keep_braces(key, attrs[key])
                    stats['attr'] += 1
                    return '%s=%s%s%s' % (name, quote, thai, quote)
                return m.group(0)
            tag = ATTR_RE.sub(attr_sub, tag)
        out.append(tag)
        i = k + 1
        # text node after the tag
        nxt = html.find('<', i)
        if nxt < 0:
            nxt = n
        seg = html[i:nxt]
        if seg and not opaque_at(i):
            stripped = seg.strip()
            key = collapse(stripped)
            if key in vismap:
                lead = seg[:len(seg) - len(seg.lstrip())]
                trail = seg[len(seg.rstrip()):]
                res = keep_braces(key, vismap[key])
                seg = lead + res + trail
                stats['text'] += 1
        out.append(seg)
        i = nxt

    html = ''.join(out)

    # 2) JS string literals (only inside script blocks, only exact matches)
    def js_block(m):
        body = m.group(0)
        if not jsmap:
            return body

        def lit(mm):
            q, txt = mm.group(1), mm.group(2)
            key = collapse(txt)
            if key in jsmap:
                thai = keep_braces(key, jsmap[key])
                if '\n' in thai or q in thai:
                    return mm.group(0)
                stats['js'] += 1
                return q + thai + q
            return mm.group(0)
        return re.sub(r"(['\"])((?:(?!\1)[^\\\n]|\\.)*)\1", lit, body)

    html = re.sub(r'<script\b.*?</script\s*>', js_block, html, flags=re.S | re.I)

    if html != orig:
        with io.open(path, 'w', encoding='utf-8', newline='') as fh:
            fh.write(html)
        return True
    return False


def main():
    attrs = load('attrs.tsv')
    jsmap = load('js2.tsv')
    vismap = load('visible.tsv')
    print('loaded: attrs=%d js=%d visible=%d' % (len(attrs), len(jsmap), len(vismap)))
    stats = {'attr': 0, 'js': 0, 'text': 0}
    changed = 0
    for theme in ('wmcms-web', 'wmcms-m'):
        base = os.path.join(PACK, 'templates', theme)
        for dirpath, _d, files in os.walk(base):
            for name in files:
                if not name.endswith('.html'):
                    continue
                if rewrite_file(os.path.join(dirpath, name), attrs, jsmap, vismap, stats):
                    changed += 1
    print('files changed %d | attributes %d | js %d | text %d'
          % (changed, stats['attr'], stats['js'], stats['text']))


if __name__ == '__main__':
    main()
