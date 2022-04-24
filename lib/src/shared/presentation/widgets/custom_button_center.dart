import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../../application/providers.dart';
import '../../domain/types/user_role_type.dart';
import '../utils/luna_colors.dart';
import 'custom_anim_cart.dart';

class CustomButtonCenter extends ConsumerStatefulWidget {
  const CustomButtonCenter({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomButtonCenter> createState() => _CustomButtonCenterState();
}

class _CustomButtonCenterState extends ConsumerState<CustomButtonCenter> {
  late LoadingButtonController _controller;

  @override
  void initState() {
    _controller = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final role = ref.watch(userController.select((value) => value.user?.role));
    final currentCart =
        ref.watch(userController.select((value) => value.user?.currentCart));
    return Center(
      heightFactor: 0.6,
      child: SizedBox(
        height: 50,
        width: 50,
        child: LoadingButton(
          controller: _controller,
          color: LunaColors.nightMedium,
          child: FloatingActionButton(
            backgroundColor: LunaColors.orangeLight,
            child: role != null
                ? role is UserRoleTypeAdmin
                    ? const Icon(Icons.add)
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          const Icon(Icons.shopping_basket),
                          if (currentCart!.isNotEmpty)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: LunaColors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  currentCart.length.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                        ],
                      )
                : const Icon(Icons.shopping_basket),
            elevation: 0.1,
            onPressed: () => role != null
                ? role is UserRoleTypeAdmin
                    ? Navigator.pushNamed(context, addProductRoute)
                    : _controller.moveToScreen(
                        context: context,
                        page: const CartPage(),
                        stopAnimation: false,
                        navigationCallback: (route) =>
                            Navigator.push(context, route),
                      )
                : null,
          ),
        ),
      ),
    );
  }
}
