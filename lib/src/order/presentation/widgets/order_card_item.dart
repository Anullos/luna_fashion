import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/models/order_model.dart';
import '../extensions/order_status_extension.dart';

class OrderCardItem extends StatelessWidget {
  final OrderModel order;
  const OrderCardItem({Key? key, required this.order}) : super(key: key);

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
                Text(S.of(context).statusOrder),
                Text(order.status.toString()),
                const Spacer(),
                const Tooltip(
                  message: 'Dirección: Calle San Rafael 14 \nTlf: 666666666',
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
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
