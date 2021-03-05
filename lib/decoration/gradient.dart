import 'package:flutter/material.dart';

class BackGradient extends StatelessWidget {
  const BackGradient({
    Key key,
    @required this.opacity,
  }) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomRight,
        colors: [
          const Color(0xFF9bffe3).withOpacity(opacity),
          const Color(0xFFffe39b).withOpacity(opacity),
          const Color(0xFFe39bff).withOpacity(opacity),
        ],
      )),
    );
  }
}
