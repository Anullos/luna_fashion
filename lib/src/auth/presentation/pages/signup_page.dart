import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../widgets/custom_anim_screen.dart';
import '../widgets/signup_form.dart';

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
  bool _isCompleted = false;
  bool _isKeyboardVisible = false;

  _navigateBack() async {
    await _animateContainerFromTopToBottom();
    Navigator.pop(context, true);
  }

  _animateContainerFromBottomToTop() async {
    await Future.delayed(_psudoDuration);
    _height = 240;
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

    if (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0 &&
        !_isKeyboardVisible) {
      _height = 60;
      _isKeyboardVisible = true;
      setState(() {});
    } else if (WidgetsBinding.instance!.window.viewInsets.bottom == 0.0 &&
        _isKeyboardVisible) {
      _height = 240;
      _isKeyboardVisible = false;
      setState(() {});
    }
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
            SignupForm(
              heightFake: _isKeyboardVisible ? 100 : 240,
              onTapLogin: _navigateBack,
              onSubmit: (result) async {
                if (result) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, onBoardingRoute);
                }
              },
            ),
            CustomAnimScreen(
              text: S.of(context).register,
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
