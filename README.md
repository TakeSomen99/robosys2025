# passwdsc: パスワード強度チェッカー
標準入力からパスワードの安全度（強度）を0～1の範囲で出力します。

## 使用技術一覧
![](https://github.com/TakeSomen99/robosys2025/actions/workflows/test.yml/badge.svg)
![Static Badge](https://img.shields.io/badge/python-blue)


## 環境
+ Ubuntu: 24.04 LTS
+ Python: 3.12.3
  + テスト済みバージョン: Python3.9~3.12

## 使い方
```bash
$ git clone ...
$ cd robosys2025
$ ./passwordsc < {任意のパスワード文字列のテキストファイル}
```

## 備考
出力される値の目安について以下に簡単な結果を示します。ご参考までに活用ください。
|パスワード|パスワード強度|
|:--|:--|
|111aaa|0.23|
|6g8o!d44?d|0.44|
|!HMnrsQ4VaGnJ-kK?2k1|0.64|

## 注意事項
標準入力にechoコマンドを用いる場合は下記の様に文字列をシングルクォートで囲ってください。
```bash
$ echo '{任意のパスワード文字列}' | ./passwdsc
```
これはパスワードに含まれる"!"などの記号が特殊文字として扱われ、echoに入る前に独自のコマンドとして処理されるためです。

## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 TakeSomen99
