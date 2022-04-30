import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/domain/models/product_model.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/utils/toasts.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';
import '../../application/product_details_controller.dart';
import '../widgets/row_quantity.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -size.width / 2,
            right: -size.width / 3,
            width: size.width * 1.4,
            height: size.width * 1.4,
            child: Hero(
              tag: 'hero_background_${product.name}',
              child: Container(
                decoration: BoxDecoration(
                  color: LunaColors.topProducts,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: kToolbarHeight + 20,
                child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      product.name.split(' ').first,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Material(
                          elevation: 10,
                          shape: CircleBorder(
                              side: BorderSide(
                            color: LunaColors.topProducts,
                          )),
                          color: LunaColors.topProducts,
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                      ),
                    ]),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: Column(
                children: [
                  Hero(
                    tag: 'hero_image_${product.name}',
                    child: Image.network(
                      product.imageUrl,
                      height: MediaQuery.of(context).size.width / 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RowQuantity(product: product),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              child: Consumer(builder: (_, ref, __) {
                ref.listen<ProductDetailsState>(
                  productDetailsController,
                  (_, next) {
                    next.addProductCardFailureOrSuccess
                      ..whenIsSuccess(() {
                        Navigator.pop(context);
                        showSuccess(context, message: 'Agregado con exito');
                      })
                      ..whenIsFailure(
                        (failure) => showError(
                          context,
                          message: failure.map(
                            unknownError: (_) => S.of(context).serverError,
                          ),
                        ),
                      );
                  },
                );
                return CustomButtonWidget(
                  isLoading: ref
                      .watch(productDetailsController)
                      .addProductCardFailureOrSuccess
                      .isLoading,
                  onTap: () => ref
                      .read(productDetailsController.notifier)
                      .addProductCart(product, ref.read(userController).user!),
                  text: 'Agregar',
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
