import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhc_assignment/decoration/gradient.dart';
import 'package:mhc_assignment/decoration/container.dart';
import 'package:mhc_assignment/screen/assignment_1.dart';
import 'package:mhc_assignment/screen/assignment_2_enhanced.dart';
import 'assignment_2.dart';

class SelectScreen extends StatelessWidget {
  static String id = 'SelectScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGradient(opacity: 1),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectScreenContainer(text: 'Assignment 1', buttonText: '課題1', navId: Assignment_1.id),
                  SelectScreenContainer(text: 'Assignment 2', buttonText: '課題2', navId: Assignment_2.id),
                  SelectScreenContainer(
                      text: 'Assignment 2-enhanced', buttonText: '同一画面上での値の扱い', navId: Assignment_2_enhanced.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectScreenContainer extends StatelessWidget {
  const SelectScreenContainer({
    Key key,
    @required this.text,
    @required this.buttonText,
    @required this.navId,
  }) : super(key: key);

  final String text;
  final String buttonText;
  final String navId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.indigoAccent),
              onPressed: () => Navigator.pushNamed(context, navId),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
