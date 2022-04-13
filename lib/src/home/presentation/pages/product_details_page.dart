import 'package:flutter/material.dart';

import '../../../shared/domain/models/product_model.dart';
import '../../../shared/presentation/utils/luna_colors.dart';

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
              child: Hero(
                tag: 'hero_image_${product.name}',
                child: Image.asset(
                  product.imageUrl,
                  height: MediaQuery.of(context).size.width / 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
