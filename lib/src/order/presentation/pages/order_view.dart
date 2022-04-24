import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
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
              const Text('Lista de pedidos'),
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
                          return OrderCardItem(order: orders[index]);
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
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('No has realizado ningún pedido'),
                        ),
                      ),
                    ),
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
