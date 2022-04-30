import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_top_products.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 0.0),
            child: HomeAppBar(),
          ),
          Consumer(
            builder: (_, ref, __) {
              final user = ref.watch(userController).user;
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                child: Text(
                  user?.fullName ?? '',
                  style: TextStyle(
                      color: LunaColors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          const HomeTopProducts(),
          Consumer(
            builder: (_, ref, __) {
              return InkWell(
                onTap: () =>
                    ref.read(homeController.notifier).pageControllerChanged(1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Text(
                    S.of(context).seeAllProducts,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: LunaColors.primary,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
