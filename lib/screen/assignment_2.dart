import 'package:flutter/material.dart';
import 'package:mhc_assignment/cosnt.dart';
import 'package:mhc_assignment/decoration/gradient.dart';
import 'package:mhc_assignment/main.dart';
import 'package:mhc_assignment/screen/select_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String globalText = '';

class Assignment_2 extends StatelessWidget {
  static String id = 'Assignment_2';

  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGradient(opacity: 1),
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('テキストフィールド', style: kGreyStyle()),
                  TextField(
                    onChanged: (value) {
                      text = value;
                      globalText = value;
                      context.read(riverpodProvider.state).name = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //MaterialPageRouteを使って値を渡す
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Assignment_2_transition(text: text),
                      ));
                    },
                    child: Text('遷移'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Assignment_2_transition extends StatelessWidget {
  static String id = 'Assignmnet_2_transition';

  final String text;
  Assignment_2_transition({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGradient(opacity: 1),
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'MaterialPageRouteを使って値を渡す場合',
                    style: kGreyStyle(),
                  ),
                  Text(text != null ? text : ''),
                  const SizedBox(height: 16),
                  Text(
                    'グローバルに宣言したVariableを使う場合',
                    style: kGreyStyle(),
                  ),
                  Text(globalText != null ? globalText : ''),
                  const SizedBox(height: 16),
                  Text(
                    'riverpodを使って値を渡す場合',
                    style: kGreyStyle(),
                  ),
                  Text(context.read(riverpodProvider.state).name),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('課題2にもどる'),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SelectScreen.id),
                    child: Text('課題選択画面ににもどる'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
