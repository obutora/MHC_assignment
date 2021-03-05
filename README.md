# mhc_assignment

MHCの課題をするよ

## 課題1 ：ライフスタイル
###サンプルアプリを作る
 - デバッグ
  - ブレークポイントを使うと、アプリの状態を止めて変数の値を確認できる！便利。

 - 出力
  - print() で最も基本的なログ出力
  - debugPrint() は長文も扱える
  - dart:developer をas developerとしてインポートすると、developer.log()が使える
  - developer.logはnameプロパティをつけることができる　← print()はごちゃごちゃしがちなので便利！
  - errorプロパティを付ければ、赤文字＝エラーとして表示可能
  - stackTraceプロパティでは、直前に実行したメソッドの内容を表示できる。 ← よくエラーでみるやつ

 - 画面とログの両方に出力する
  - Sliderを操作するとprint()とdeveloper.log()を使ったログがIDEに出力されるようにした
  - 画面上にもopacityの値が小数点第2位で丸められた状態で表示される
  - 名付けて 👨‍🏫opacity slider - おぱすら



