import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes.dart';
import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../widgets/order_card_item.dart';

class OrderView extends ConsumerWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersStream = ref.watch(ordersList);
    return ordersStream.when(
      data: (orders) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).orderList,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              orders.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: orders.length,
                        reverse: true,
                        padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, orderDetailsRoute,
                                arguments: orders[index]),
                            child: OrderCardItem(order: orders[index]),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(S.of(context).haveNotPlacedOrder),
                        ),
                      ),
                    ),
              const SizedBox(height: 70),
            ],
          ),
        );
      },
      error: (error, _) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
