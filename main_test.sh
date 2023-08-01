#!/bin/bash

tmp=/tmp/$$ # 変数を使って表記を短く


ERROR_EXIT () {
    #echo "$1" >&2 # エラーメッセージ(引数1)を標準エラー出⼒に表⽰
    cat $tmp-error
    rm -f $tmp-* # 作ったファイルの削除
    exit 1 # エラー終了
}

# テスト開始
echo "teat1-1: 正常系"
./report5.sh 5 10 > $tmp-result
echo "5" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test1-1" >> $tmp-error

echo "teat1-2: 正常系"
./report5.sh 21 14 > $tmp-result
echo "7" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test1-2" >> $tmp-error

echo "teat2-1: 異常系(引数なし)"
./report5.sh > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test2-1" >> $tmp-error

echo "teat2-2: 異常系(引数一つ)"
./report5.sh 21 > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test2-2" >> $tmp-error

echo "teat2-3: 異常系(引数がマイナスの値)"
./report5.sh -21 > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test2-3" >> $tmp-error

echo "teat2-4: 異常系(引数がマイナスの値)"
./report5.sh 21 -1 > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test2-4" >> $tmp-error

echo "teat2-5: 異常系(引数が文字列)"
./report5.sh "abc" > $tmp-result
echo "Error!" > $tmp-ans
diff $tmp-result $tmp-ans || echo "error in test2-5" >> $tmp-error

# テストでエラーがあった場合はエラー出力
if [ -f $tmp-error ]; then
    ERROR_EXIT
fi
