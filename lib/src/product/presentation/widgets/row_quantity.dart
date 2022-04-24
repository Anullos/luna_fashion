import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/domain/models/product_model.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';

class RowQuantity extends ConsumerWidget {
  const RowQuantity({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = (ref.watch(productDetailsController).quantity * product.price)
        .toStringAsFixed(2);
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                  onPressed: () => ref
                      .read(productDetailsController.notifier)
                      .quantityChanged(-1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: RichText(
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).quantity,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: ref
                              .watch(productDetailsController)
                              .quantity
                              .toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Icon(Icons.add),
                  onPressed: () => ref
                      .read(productDetailsController.notifier)
                      .quantityChanged(1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: RichText(
                softWrap: true,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: S.of(context).total,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: '$total €',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
