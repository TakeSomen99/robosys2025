#!/bin/bash
#SPDX-FileCopyrightText: 2025 TakeSomen99
#SPDX-License-Identifier: BSD-3-Clause

ng(){
    echo ${1}行目が違うよ
    res=1
}

res=0

### NORMAL INPUT ###
out=$(echo '111aaa' | ./passwdsc)
[ "${out}" =  0.23 ] || ng "$LINENO"

### STRANGE INPUT ###
#input double byte character
out=$(echo あ | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#input that has space
out=$(echo 'aa bb' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#input empty
out=$(echo | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
