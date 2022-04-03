import 'package:flutter/material.dart';

import '../widgets/custom_anim_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late double _height;
  late double _iconHeight;
  late double _iconWidth;
  late double _radioValue;
  final _duration = const Duration(milliseconds: 750);
  final _durationIcon = const Duration(milliseconds: 450);
  final _psudoDuration = const Duration(milliseconds: 150);
  bool _isCompleted = false;

  _animateContainerFromBottomToTop() async {
    await Future.delayed(_psudoDuration);
    _height = 60;
    _radioValue = 60;
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

    if (!_isCompleted) {
      _height = MediaQuery.of(context).size.height;
      _radioValue = 0;
      _iconHeight = 100;
      _iconWidth = 100;
      setState(() {});

      _animateContainerFromBottomToTop();
    }
    _isCompleted = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomAnimScreen(
            text: '',
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
    );
  }
}
