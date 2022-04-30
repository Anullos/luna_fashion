import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/functions.dart';
import '../../domain/models/order_model.dart';

class ResumeOrder extends ConsumerWidget {
  const ResumeOrder({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).totalOfProducts,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  getTotalProducts(order.products),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).totalToPay,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${getTotalPayment(order.products)} €',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
