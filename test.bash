#!/bin/bash
#SPDX-FileCopyrightText: 2025 TakeSomen99
#SPDX-License-Identifier: BSD-3-Clause

ng(){
    echo ${1}行目が違うよ
    echo ${2}
    res=1
}

res=0

### NORMAL INPUT ###
out=$(echo '111aaa' | ./passwdsc)
[ "$?" = 0 ] || ng "$LINENO"

### STRANGE INPUT ###
#input double byte character
out=$(echo あ | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO" "2バイト文字が入力されてるよ"

#input has double byte alphabet
out=$(echo 'Ａbc123!' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO" "2バイト文字が含まれているよ"

#input has emoji 
out=$(echo '😀' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO" "絵文字が入力されてるよ"

#input has synthetic character
out=$(echo 'é' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO" "合成文字が入力されてるよ"

#input has double byte mark
out=$(echo 'aA1！' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO" "2バイト記号が含まれているよ"

#input that has space
out=$(echo 'aa bb' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO" "空白が含まれているよ"

#input img
out=$(cat sample_files/blue_bird.png | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO" "イメージファイルが入力されてるよ"

#input 1M data
out=$(head -c 1M /dev/zero | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO" "巨大入力(1MByte)が入力されてるよ"

#use printf
out=$(printf '\x00\x01\x02\x1b\x7f' | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO" "制御用文字が含まれてるよ"

#input empty
out=$(printf | ./passwdsc)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO" "無入力だよ"

[ "${res}" = 0 ] && echo OK
exit $res
