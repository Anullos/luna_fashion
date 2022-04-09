import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 40),
        Consumer(builder: (_, ref, __) {
          final user = ref.watch(userController).user;
          return Text(
            user!.fullName,
            style: Theme.of(context).textTheme.headline5,
          );
        }),
      ],
    );
  }
}
