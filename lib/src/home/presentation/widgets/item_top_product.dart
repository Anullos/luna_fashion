import 'package:flutter/material.dart';

import '../../../shared/domain/models/product_model.dart';
import '../../../shared/presentation/utils/luna_colors.dart';

class ItemTopProduct extends StatelessWidget {
  const ItemTopProduct({
    Key? key,
    required this.transform,
    required this.transformProduct,
    required this.product,
    required this.onTap,
  }) : super(key: key);
  final Matrix4 transform;
  final Matrix4 transformProduct;
  final ProductModel product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const marginCenter = EdgeInsets.symmetric(horizontal: 50, vertical: 15);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 28.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: transform,
              child: Stack(
                children: [
                  Hero(
                    tag: 'hero_background_${product.name}',
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: marginCenter,
                      color: LunaColors.topProducts,
                      child: const SizedBox.expand(),
                    ),
                  ),
                  Container(
                    margin: marginCenter,
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name.split(' ').join('\n'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // InkWell(
                            //   onTap: () {
                            //     print('add  to cart');
                            //   },
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: LunaColors.orangeLight,
                            //     ),
                            //     child: Icon(
                            //       Icons.add_circle,
                            //       color: LunaColors.white,
                            //       size: 36,
                            //     ),
                            //   ),
                            // ),
                            Container(),
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Transform(
                alignment: Alignment.center,
                transform: transformProduct,
                child: Hero(
                  tag: 'hero_image_${product.name}',
                  child: Image.asset(
                    product.imageUrl,
                    height: size.width / 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
