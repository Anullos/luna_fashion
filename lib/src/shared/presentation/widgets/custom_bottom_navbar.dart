import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes.dart';
import '../../application/providers.dart';
import '../../domain/types/user_role_type.dart';
import '../../infrastructure/data/session_data.dart';
import '../utils/luna_colors.dart';
import 'custom_bottom_navbar_painter.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 64;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          // Background
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: CustomBottomNavbarPainter(
                backgroundColor: LunaColors.nightMedium),
          ),
          // Button center
          Consumer(builder: (_, ref, __) {
            final role =
                ref.watch(userController.select((value) => value.user?.role));
            return Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                backgroundColor: LunaColors.orangeLight,
                child: Icon(role != null
                    ? role is UserRoleTypeAdmin
                        ? Icons.add
                        : Icons.shopping_basket
                    : Icons.shopping_basket),
                elevation: 0.1,
                onPressed: () => role != null
                    ? role is UserRoleTypeAdmin
                        ? Navigator.pushNamed(context, addProductRoute)
                        : Navigator.pushNamed(context, seeOrdersRoute)
                    : null,
              ),
            );
          }),
          // Buttons navigation
          Consumer(builder: (_, ref, __) {
            final pageIndex =
                ref.watch(homeController.select((value) => value.pageIndex));
            final role =
                ref.watch(userController.select((value) => value.user?.role));
            return SizedBox(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarIcon(
                    text: role != null && role is UserRoleTypeAdmin
                        ? sessionsAdminHome[0].getName(ref
                            .read(localizationController)
                            .locale
                            .languageCode)
                        : sessionsHome[0].getName(ref
                            .read(localizationController)
                            .locale
                            .languageCode),
                    icon: Icons.home_outlined,
                    selected: pageIndex == 0,
                    onPressed: () => ref
                        .read(homeController.notifier)
                        .pageControllerChanged(0),
                    defaultColor: LunaColors.black,
                    selectedColor: LunaColors.white,
                  ),
                  NavBarIcon(
                    text: role != null && role is UserRoleTypeAdmin
                        ? sessionsAdminHome[1].getName(ref
                            .read(localizationController)
                            .locale
                            .languageCode)
                        : sessionsHome[1].getName(ref
                            .read(localizationController)
                            .locale
                            .languageCode),
                    icon: Icons.featured_play_list_outlined,
                    selected: pageIndex == 1,
                    onPressed: () => ref
                        .read(homeController.notifier)
                        .pageControllerChanged(1),
                    defaultColor: LunaColors.black,
                    selectedColor: LunaColors.white,
                  ),
                  const SizedBox(width: 56),
                  NavBarIcon(
                      text: role != null && role is UserRoleTypeAdmin
                          ? sessionsAdminHome[2].getName(ref
                              .read(localizationController)
                              .locale
                              .languageCode)
                          : sessionsHome[2].getName(ref
                              .read(localizationController)
                              .locale
                              .languageCode),
                      icon: Icons.local_grocery_store_outlined,
                      selected: pageIndex == 2,
                      onPressed: () => ref
                          .read(homeController.notifier)
                          .pageControllerChanged(2),
                      defaultColor: LunaColors.black,
                      selectedColor: LunaColors.white),
                  NavBarIcon(
                    text: role != null && role is UserRoleTypeAdmin
                        ? sessionsAdminHome[3].getName(ref
                            .read(localizationController)
                            .locale
                            .languageCode)
                        : sessionsHome[3].getName(ref
                            .read(localizationController)
                            .locale
                            .languageCode),
                    icon: Icons.person_outline_outlined,
                    selected: pageIndex == 3,
                    onPressed: () => ref
                        .read(homeController.notifier)
                        .pageControllerChanged(3),
                    selectedColor: LunaColors.white,
                    defaultColor: LunaColors.black,
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
        selected
            ? Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: selectedColor),
              )
            : Container(),
      ],
    );
  }
}
