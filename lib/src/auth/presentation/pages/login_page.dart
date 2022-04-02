import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../widgets/custom_anim_screen.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double _height;
  late double _iconHeight;
  late double _iconWidth;
  late double _radioValue;
  final _duration = const Duration(milliseconds: 750);
  final _durationIcon = const Duration(milliseconds: 450);
  final _psudoDuration = const Duration(milliseconds: 150);
  bool _isCompleted = false;
  bool _isKeyboardVisible = false;
  bool _isOtherPage = false;

  _navigateSignUp() async {
    FocusScope.of(context).requestFocus(FocusNode());
    await _animateContainerFromTopToBottom();
    _isOtherPage = true;
    Navigator.pushNamed(context, signupRoute).then((value) {
      if (value == true) {
        _animateContainerFromBottomToTop();
        _isCompleted = true;
        _isOtherPage = false;
      }
    });
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
      _iconHeight = 200;
      _iconWidth = 200;
      setState(() {});

      _animateContainerFromBottomToTop();
    }
    _isCompleted = true;

    if (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0 &&
        !_isKeyboardVisible &&
        _isCompleted &&
        !_isOtherPage) {
      _height = 60;
      _isKeyboardVisible = true;
      setState(() {});
    } else if (WidgetsBinding.instance!.window.viewInsets.bottom == 0.0 &&
        _isKeyboardVisible &&
        _isCompleted &&
        !_isOtherPage) {
      _height = 240;
      _isKeyboardVisible = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          LoginForm(
            heightFake: _isKeyboardVisible ? 100 : 240,
            onTapRegister: _navigateSignUp,
          ),
          CustomAnimScreen(
            text: 'Login',
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
