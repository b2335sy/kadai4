#!/usr/bin/bash

#引数の数のチェック
if [ ! $# -eq 2 ];then
  echo "Number of inputs is error"
  exit 1
fi

#引数が自然数かどうかをチェック
if [[ ! $1 =~ ^[0-9]+$ ]] || [[ ! $2 =~ ^[0-9]+$ ]] ; then
  echo "Type of input is error"
  exit 1
fi

#最大公約数の計算
if [ $1 -lt $2 ]; then
  lesser=$1
  greater=$2
else
  lesser=$2
  greater=$1
fi

remainder=$(($greater % $lesser))

while [ ! 0 -eq $remainder ]; do
  greater=$lesser
  lesser=$remainder
  remainder=$(($greater % $lesser))
done

echo $lesser
