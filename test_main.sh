#!/usr/bin/bash

tmp=/tmp/$$

ERROR_EXIT () { # ERROR関数
 echo "$1" >&2 # エラーメッセージ(引数1)を標準エラー出⼒に表⽰
 rm -f /tmp/$$-* # 作ったファイルの削除
 exit 1 # エラー終了
}


./main.sh 15 10 > $tmp-result
echo "5" > $tmp-ans
diff $tmp-result $tmp-ans || echo "incorrect calc error" >> $tmp-error

./main.sh > $tmp-result
echo "Number of inputs is error" > $tmp-ans
diff $tmp-result $tmp-ans || echo "input value error" >> $tmp-error

./main.sh "a" > $tmp-result
echo "Type of input is error" > $tmp-ans
diff $tmp-result $tmp-ans || echo "input type error" >> $tmp-error

if [ -f $tmp-error ]; then
    ERROR_EXIT
fi
