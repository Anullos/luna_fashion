import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../order/domain/models/product_order_model.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';

class CartItem extends StatelessWidget {
  final ProductOrderModel productItem;
  final VoidCallback onDelete;
  final VoidCallback lessQuantity;
  final VoidCallback moreQuantity;
  const CartItem(
      {Key? key,
      required this.productItem,
      required this.onDelete,
      required this.lessQuantity,
      required this.moreQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _total = productItem.product.price.toDouble() * productItem.quantity;
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            // Imagen del cart
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                productItem.product.imageUrl,
                width: 100,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // Texto del cart
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  productItem.product.name,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 3.0),
                                Text(
                                  '${_total.toStringAsFixed(2)}€',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: onDelete,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Cantidad del cart
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          onPressed: lessQuantity,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: RichText(
                            softWrap: true,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: S.of(context).quantity,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '${productItem.quantity}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          child: const Icon(Icons.add),
                          onPressed: moreQuantity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
