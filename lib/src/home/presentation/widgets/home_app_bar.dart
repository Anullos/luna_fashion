import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/luna_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Luna Fashion',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: LunaColors.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        Image.asset(
          'assets/luna_logo.png',
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}
