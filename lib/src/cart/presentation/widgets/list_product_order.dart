import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import 'cart_item.dart';

class ListProductOrder extends ConsumerWidget {
  const ListProductOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCart =
        ref.watch(userController.select((value) => value.user?.currentCart));
    return currentCart!.isEmpty
        ? Container(
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            child: Align(
              alignment: Alignment.center,
              child: Text(S.of(context).haveNotItemsInCart),
            ),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: currentCart.length,
            padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
            itemBuilder: (context, index) {
              return CartItem(
                productItem: currentCart[index],
                onDelete: () => ref
                    .read(cartController.notifier)
                    .removeProductCart(
                        currentCart[index], ref.read(userController).user!),
                lessQuantity: () {},
                moreQuantity: () {},
              );
            },
          );
  }
}
