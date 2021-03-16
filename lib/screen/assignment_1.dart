import 'dart:ui';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhc_assignment/cosnt.dart';
import 'package:mhc_assignment/decoration/gradient.dart';
import 'package:mhc_assignment/decoration/container.dart';

class Assignment_1 extends StatefulWidget {
  static String id = 'homeScreen';

  @override
  _Assignment_1State createState() => _Assignment_1State();
}

class _Assignment_1State extends State<Assignment_1> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          BackGradient(opacity: opacity),
          Center(
            child: RoundedContainer(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Opacity Slider - おぱすら \n' + opacity.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                  style: kGreyStyle(),
                ),
                Slider(
                    activeColor: Colors.blueGrey,
                    min: 0.5,
                    max: 1,
                    value: opacity,
                    onChanged: (value) {
                      setState(() {
                        opacity = value;
                        // print(value);
                        developer.log(
                          value.toString(),
                          name: 'おぱしてぃ',
                          // stackTrace: StackTrace.current, //直前に実行していたメソッドなどの履歴を表示できる
                          // error: FormatException('エラーを赤文字で出力できる！'),
                        );
                      });
                    }),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
