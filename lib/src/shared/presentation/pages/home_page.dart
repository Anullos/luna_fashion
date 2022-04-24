import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../admin/presentation/pages/orders_view.dart';
import '../../../admin/presentation/pages/products_admin_view.dart';
import '../../../home/presentation/pages/home_view.dart';
import '../../../order/presentation/pages/order_view.dart';
import '../../../product/presentation/pages/products_view.dart';
import '../../application/providers.dart';
import '../../../user/presentation/pages/profile_view.dart';
import '../../domain/types/user_role_type.dart';
import '../widgets/page_view_empty.dart';
import '../widgets/custom_bottom_navbar.dart';
import '../widgets/custom_anim_home.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late double _height;
  late double _iconHeight;
  late double _iconWidth;
  late double _radioValue;
  final _duration = const Duration(milliseconds: 750);
  final _durationIcon = const Duration(milliseconds: 450);
  final _psudoDuration = const Duration(milliseconds: 150);
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
  }

  _animateContainerStartToButton() async {
    await Future.delayed(_psudoDuration);
    _height = 0;
    _radioValue = 200;
    _iconHeight = 20;
    _iconWidth = 20;
    setState(() {});
    await Future.delayed(_durationIcon);
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
    final user = ref.watch(userController).user;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView(
              controller: ref.watch(homeController).pageController,
              onPageChanged: ref.read(homeController.notifier).pageChanged,
              children: user == null
                  ? noneHome
                  : user.role is UserRoleTypeAdmin
                      ? adminHome
                      : user.role is UserRoleTypeUser
                          ? userHome
                          : noneHome,
            ),
            user == null
                ? Container()
                : Container(
                    alignment: Alignment.bottomCenter,
                    child: const CustomBottomNavbar(),
                  ),
            CustomAnimHome(
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
      ),
    );
  }
}

final noneHome = [
  const PageViewEmpty(),
  const PageViewEmpty(),
  const PageViewEmpty(),
  const PageViewEmpty(),
];

final userHome = [
  const HomeView(),
  const ProductsView(),
  const OrderView(),
  const ProfileView(),
];

final adminHome = [
  const HomeView(),
  const OrdersView(),
  const ProductsAdminView(),
  const ProfileView(),
];
