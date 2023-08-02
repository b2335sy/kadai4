#!/usr/bin/bash

ans=/tmp/$$-ans
result=/tmp/$$-result
err_log=/tmp/$$-errors

#テスト0：通常操作
./main.sh 15 10 > $result
echo "5" > $ans
diff $result $ans || echo "test0 : incorrect calc error" >> $err_log

#テスト1：引数なし
./main.sh > $result
echo "Number of inputs is error" > $ans
diff $result $ans || echo "test1 : args error" >> $err_log

#テスト2：引数が2つとも数字以外
./main.sh "a" "b" > $result
echo "Type of input is error" > $ans
diff $result $ans || echo "test2 : input type error" >> $err_log

#テスト3：引数が1つだけ、尚且つ数字以外
./main.sh "a" > $result
echo "Number of inputs is error" > $ans
diff $result $ans || echo "test3 : args and value erorr " >> $err_log

#テスト4：引数がマイナスの場合
./main.sh "100" "-50" > $result
echo "Type of input is error" > $ans
diff $result $ans || echo "test4 : input type error" >> $err_log

if [ -f $err_log ]; then
  echo "error occurred"
  cat $err_log 1>&2
  rm -f $ans $result $err_log
  exit 1
else
  rm -f $ans $result $err_log
fi
