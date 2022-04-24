import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';
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
                  const ListProductOrder(),
                  const SizedBox(height: 20),
                  // Resumen de coste
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
                  // Boton Order Pedido
                  Consumer(builder: (_, ref, __) {
                    ref.watch(cartController);
                    return Center(
                      child: CustomButtonWidget(
                        isLoading: false,
                        onTap: () {},
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
