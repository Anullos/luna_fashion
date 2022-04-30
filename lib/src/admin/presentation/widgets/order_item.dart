import 'package:flutter/material.dart';

import '../../../order/domain/models/order_model.dart';
import '../../../order/presentation/extensions/order_status_extension.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;
  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalProductos = 0;
    double totalPagar = 0;
    for (var i = 0; i < order.products.length; i++) {
      totalProductos += order.products[i].quantity;
      totalPagar +=
          order.products[i].quantity * order.products[i].product.price;
    }

    return Card(
      color: order.status.getColor(),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(S.of(context).realiceBy),
                Text(order.userFullName),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).totalOfProducts),
                  Text(totalProductos.toString()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).totalToPay),
                Text(totalPagar.toStringAsFixed(2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
