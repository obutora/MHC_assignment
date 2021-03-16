# mhc_assignment

MHCの課題をするよ

## 課題1 ：ライフスタイル
### サンプルアプリを作る
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
   - 名付けて **👨‍🏫opacity slider - おぱすら** である。

***

## 課題2 ：画面間のデータの受け渡し
 - A画面からB画面にデータを渡す
  ##### MaterialPageRouteを使う方法
  ```
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
         Assignment_2_transition(text: text),
     ));
  ```
  - こんな感じで、Navigator.of(context).push()に渡してあげる方法。
  - カンタン。一方通行で良ければこの実装でOK。
   ##### グローバルに宣言したVariableを使う方法
  - 一番カンタンな方法だが、どんな場所からも呼び出せてしまうため、バグの温床になる可能性大
  - 基本、使わない。
  - const にして不変にして渡す場合はあるかもしれない。
  
  
##### riverpodを使って値を渡す場合
  - 実際にはほぼこれしか使わない気がしている。

#### +α リビルド制御 with Riverpod
 - よき機会なので、値の受け渡し時のUI構築で考えるべきリビルド制御のお勉強。
 - StateNotifierは唯一のStateを持つWidget。Stateが変更されると関連Widgetに通知することができる。
 - Stateに自前のクラスを指定した場合、プロパティを変更するだけでは変更通知がなされない為、Stateごと変更する必要がある。
 - Freezedを使えば、.copywithメソッドを使うことで変更通知が超簡単になる（未実装）
 - StateNotifierはChangeNotifierと違ってnotifylistenersを使う必要がなくなる。
 - context.read()を使った呼び出しではリビルドが発生しない。
 - context.read()はビルドメソッド内で呼び出すとパフォーマンスが大幅に低下するので注意。（普通に動作するのでもっと注意）
 - useProvider()を使って呼び出すと、変更通知があった時に対象Widgetがリビルドされる。