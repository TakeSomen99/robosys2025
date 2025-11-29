# passwdsc: パスワード強度チェッカー
標準入力からパスワードの安全度（強度）を0～1の範囲で出力します。

## 使用技術一覧
![Static Badge](https://img.shields.io/badge/python-blue)

## 環境
+ Ubuntu 24.04 LTS
+ Python 3.12.3

## 使い方
```bash
$ git clone ...
$ cd robosys2025
$ ./passwordsc < {任意のパスワードを含むテキストファイル}
```

## 備考
出力される値の目安について以下に簡単な結果を示します。ご参考までに活用ください。
|パスワード|パスワード強度|
|:--|:--|
|111aaa|0.23|
|6g8o!d44?d|0.44|
|!HMnrsQ4VaGnJ-kK?2k1|0.64|

## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 TakeSomen99
- このパッケージは，Ryuichi Ueda由来のコード（© 2025 Ryuichi Ueda）を利用しています．
- このパッケージのコードは，下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを，本人の許可を得て自身の著作としたものです．
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
- © 2025 Ryuichi Ueda
