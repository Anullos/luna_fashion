import 'package:flutter/material.dart';

import '../widgets/custom_anim_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late double _height;
  late double _iconHeight;
  late double _iconWidth;
  late double _radioValue;
  final _duration = const Duration(milliseconds: 750);
  final _durationIcon = const Duration(milliseconds: 450);
  final _psudoDuration = const Duration(milliseconds: 150);

  _navigateBack() async {
    await _animateContainerFromTopToBottom();
    Navigator.pop(context, true);
  }

  _animateContainerFromBottomToTop() async {
    await Future.delayed(_psudoDuration);
    _height = 240;
    _radioValue = 100;
    _iconHeight = 100;
    _iconWidth = 100;
    setState(() {});
  }

  _animateContainerFromTopToBottom() async {
    _height = MediaQuery.of(context).size.height;
    _radioValue = 0;
    setState(() {});
    await Future.delayed(_duration);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _height = MediaQuery.of(context).size.height;
    _radioValue = 0;
    _iconHeight = 100;
    _iconWidth = 100;
    setState(() {});

    _animateContainerFromBottomToTop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _navigateBack();
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            CustomAnimScreen(
              text: 'Register',
              isCompleted: _height == 240,
              duration: _duration,
              height: _height,
              radioValue: _radioValue,
              durationIcon: _durationIcon,
              iconHeight: _iconHeight,
              iconWidth: _iconWidth,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
