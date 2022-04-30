import 'package:flutter/material.dart';

import '../../../shared/domain/models/product_model.dart';
import '../../../shared/presentation/utils/luna_colors.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);
  final ProductModel product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'hero_background_${product.name}',
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: LunaColors.topProducts,
              child: const SizedBox.expand(),
            ),
          ),
          Container(
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
          Center(
            child: Hero(
              tag: 'hero_image_${product.name}',
              child: Image.network(
                product.imageUrl,
                height: 90,
                width: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
