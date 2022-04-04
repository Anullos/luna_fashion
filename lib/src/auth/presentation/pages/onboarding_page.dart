import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes.dart';
import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/utils/toasts.dart';
import '../../application/onboarding_controller.dart';
import '../../infrastructure/data/data_pages.dart';
import '../widgets/custom_anim_onboarding.dart';
import '../widgets/custom_concentric_pageview.dart';
import '../widgets/onboarding_item_page.dart';

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

  _animateContainerStartToButton() async {
    await Future.delayed(_psudoDuration);
    _height = 0;
    _radioValue = 200;
    _iconHeight = 20;
    _iconWidth = 20;
    setState(() {});
    await Future.delayed(_durationIcon);
  }

  _animateContainerFromButtonToEnd(WidgetRef ref) async {
    _height = MediaQuery.of(context).size.height;
    _radioValue = 0;
    _iconHeight = 100;
    _iconWidth = 100;
    setState(() {});
    await Future.delayed(_duration);
    Navigator.of(context).pushReplacementNamed(homeRoute);
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

      _animateContainerStartToButton();
    }
    _isCompleted = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (_, ref, __) {
        ref.listen<OnBoardingState>(
          onBoardingControllerProvider,
          (_, next) {
            next.sendOnboardingFailureOrSuccess
              ..whenIsFailure(
                (failure) => showError(
                  context,
                  message: failure.map(
                    unknownError: (_) => S.of(context).unknownError,
                  ),
                ),
              )
              ..whenIsSuccess(() {
                _animateContainerFromButtonToEnd(ref);
              });
          },
        );
        return Stack(
          fit: StackFit.expand,
          children: [
            CustomConcentricPageView(
              colors: [Colors.white, LunaColors.nightMedium, Colors.white],
              gradientColors: [
                LunaColors.gradientWhite,
                LunaColors.backgroundAuthGradient,
                LunaColors.gradientWhite,
              ],
              curve: Curves.ease,
              duration: const Duration(milliseconds: 1200),
              itemCount: listPage.length,
              onFinish: ref
                  .read(onBoardingControllerProvider.notifier)
                  .sendOnboarding,
              itemBuilder: (int index, double value) {
                final page = listPage[index];
                return OnBoardingItemPage(
                  page: page,
                  index: index,
                );
              },
            ),
            CustomAnimOnBoarding(
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
        );
      }),
    );
  }
}
