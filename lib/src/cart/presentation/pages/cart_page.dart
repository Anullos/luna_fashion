import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/utils/toasts.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';
import '../../application/cart_controller.dart';
import '../widgets/list_product_order.dart';
import '../widgets/resume_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: LunaColors.nightMedium,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      S.of(context).cart,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: LunaColors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).myProducts,
                    style: TextStyle(fontSize: 20, color: LunaColors.white),
                  ),
                  // List of products
                  const ListProductOrder(),
                  const SizedBox(height: 20),
                  // Resume
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        S.of(context).resume,
                        style: TextStyle(fontSize: 20, color: LunaColors.white),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ResumeCart(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Botton Order
                  Consumer(builder: (_, ref, __) {
                    ref.listen<CartState>(
                      cartController,
                      (_, next) {
                        next.createOrderFailureOrSuccess
                          ..whenIsSuccess(() {
                            Navigator.pop(context);
                            showSuccess(context,
                                message: S.of(context).orderSend);
                          })
                          ..whenIsFailure(
                            (failure) => showError(
                              context,
                              message: failure.map(
                                unknownError: (_) => S.of(context).unknownError,
                              ),
                            ),
                          );
                      },
                    );
                    final user = ref.watch(userController).user!;
                    return Center(
                      child: CustomButtonWidget(
                        isLoading: false,
                        onTap: user.currentCart.isEmpty
                            ? null
                            : () => ref
                                .read(cartController.notifier)
                                .createOrder(user),
                        text: S.of(context).sendOrder,
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
