#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Kazuya Sawazaki
# SPDX-License-Identifier: BSD-3-Clause
import sys
import math

def tonum(s):
    try:
        return int(s)
    except ValueError:
        return float(s)

a = []

for line in sys.stdin:
    a.append(tonum(line.rstrip()))

n = len(a)
x = 0

for i in a:
    x += i

ave = x / n

v = 0
for i in a:
    v += (i - ave) ** 2

v = v / n
s = math.sqrt(v)

print("平均:", ave)
print("分散:", v)
print("標準偏差:", s)