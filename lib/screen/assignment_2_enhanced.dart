import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:mhc_assignment/decoration/container.dart';
import 'package:mhc_assignment/decoration/gradient.dart';
import 'package:mhc_assignment/main.dart';
import 'package:mhc_assignment/cosnt.dart';
import 'package:mhc_assignment/screen/select_screen.dart';

class Assignment_2_enhanced extends StatelessWidget {
  static String id = 'Assignment_2_enhanced';

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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RoundedContainer(
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('stateに値を注入するためのTextField', style: kGreyStyle()),
                          TextField(
                            onChanged: (value) {
                              // provider.changeName(value);
                              context.read(riverpodProvider).changeName(value);
                              // context.read(riverpodProvider.state).name = value;
                            },
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  developer.log(
                                      context.read(riverpodProvider.state).name,
                                      name: 'providerの中身');
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TestTextContainer(
                      title: 'context.readで値を読む場合\nonChangedでリビルドされない'),
                  const SizedBox(height: 8),
                  TestHookContainer(
                    title: 'useProviderで値を読む場合\nonChangedの度にリビルドされる',
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SelectScreen.id);
                    },
                    child: Text('もどる'),
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

class TestTextContainer extends StatelessWidget {
  const TestTextContainer({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: 80,
      child: Column(
        children: [
          Text(
            title,
            style: kGreyStyle(),
          ),
          Text(context.read(riverpodProvider.state).name),
        ],
      ),
    );
  }
}

class TestHookContainer extends HookWidget {
  const TestHookContainer({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final state = useProvider(riverpodProvider.state);
    return RoundedContainer(
      height: 80,
      child: Column(
        children: [
          Text(title, style: kGreyStyle()),
          Text(state.name),
        ],
      ),
    );
  }
}
