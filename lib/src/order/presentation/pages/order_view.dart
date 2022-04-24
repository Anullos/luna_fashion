import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/domain/models/product_model.dart';
import '../../../shared/domain/types/category_product_type.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/product_order_model.dart';
import '../../domain/types/order_status_type.dart';
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
              order1.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: order1.length,
                        reverse: true,
                        padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                        itemBuilder: (context, index) {
                          return OrderCardItem(order: order1[index]);
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

final order1 = [
  OrderModel(
    id: '1',
    products: [
      ProductOrderModel(
        id: '1',
        product: ProductModel(
          id: '1',
          name: 'Melon',
          description: 'agukana matata',
          imageUrl: 'imageUrl',
          category: CategoryProductType.caps(),
          price: 2.50,
          oldPrice: 4.5,
        ),
        quantity: 2,
      ),
    ],
    status: OrderStatusType.pending(),
    atCreated: 1222,
    atUpdated: 2200,
  ),
  OrderModel(
    id: '1',
    products: [
      ProductOrderModel(
        id: '1',
        product: ProductModel(
          id: '1',
          name: 'Melon',
          description: 'agukana matata',
          imageUrl: 'imageUrl',
          category: CategoryProductType.caps(),
          price: 2.50,
          oldPrice: 4.5,
        ),
        quantity: 2,
      ),
    ],
    status: OrderStatusType.completed(),
    atCreated: 1222,
    atUpdated: 2200,
  ),
];
