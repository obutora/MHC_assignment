import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mhc_assignment/screen/assignment_1.dart';
import 'package:mhc_assignment/screen/assignment_2_enhanced.dart';
import 'package:mhc_assignment/state/riverpod.dart';
import 'screen/assignment_2.dart';
import 'package:mhc_assignment/screen/select_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final riverpodProvider = StateNotifierProvider((ref) => ModelNotifier());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MHC_Assignment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SelectScreen.id,
        routes: <String, WidgetBuilder>{
          SelectScreen.id: (context) => SelectScreen(),
          Assignment_1.id: (context) => Assignment_1(),
          Assignment_2.id: (context) => Assignment_2(),
          Assignment_2_transition.id: (context) => Assignment_2_transition(),
          Assignment_2_enhanced.id: (context) => Assignment_2_enhanced(),
        });
  }
}
