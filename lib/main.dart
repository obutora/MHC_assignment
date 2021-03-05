import 'package:flutter/material.dart';
import 'package:mhc_assignment/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MHC＿Assignment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.id,
        routes: <String, WidgetBuilder>{
          HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
