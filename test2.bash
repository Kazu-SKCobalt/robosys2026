#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kazuya Sawazaki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目のテスト失敗
        res=1
}

res=0

### NORMAL INPUT ###
out=$(printf '10\n20\n30\n' | python3 AveVSd.py)
[ "$?" = 0 ] || ng "$LINENO"

[ "${out}" = "$(printf '平均: 20.0\n分散: 66.66666666666667\n標準偏差: 8.16496580927726')" ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | python3 AveVSd.py 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | python3 AveVSd.py 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
