import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../order/domain/types/order_status_type.dart';
import '../../../order/presentation/extensions/order_status_extension.dart';
import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../widgets/orders_list_type.dart';

class OrdersAdminView extends ConsumerWidget {
  const OrdersAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersStream = ref.watch(ordersAdminStream);
    return ordersStream.when(
      data: (orders) {
        final ordersPending = orders
            .where((order) =>
                order.status.toString() == OrderStatusType.pending().toString())
            .toList();
        final ordersPickUp = orders
            .where((order) =>
                order.status.toString() == OrderStatusType.pickUp().toString())
            .toList();
        final ordersCompleted = orders
            .where((order) =>
                order.status.toString() ==
                OrderStatusType.completed().toString())
            .toList();
        final ordersRejected = orders
            .where((order) =>
                order.status.toString() ==
                OrderStatusType.rejected().toString())
            .toList();

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  S.of(context).orderList,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  S
                      .of(context)
                      .status(OrderStatusType.pending().toTranslation(context)),
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OrdersListType(orders: ordersPending),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  S
                      .of(context)
                      .status(OrderStatusType.pickUp().toTranslation(context)),
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OrdersListType(orders: ordersPickUp),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  S.of(context).status(
                      OrderStatusType.completed().toTranslation(context)),
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OrdersListType(orders: ordersCompleted),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  S.of(context).status(
                      OrderStatusType.rejected().toTranslation(context)),
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OrdersListType(orders: ordersRejected),
              const SizedBox(height: 100),
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
