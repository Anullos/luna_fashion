import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../../order/domain/models/order_model.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import 'order_item.dart';

class OrdersListType extends StatelessWidget {
  const OrdersListType({Key? key, required this.orders}) : super(key: key);
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return orders.isNotEmpty
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
                      context, orderDetailsAdminRoute,
                      arguments: orders[index]),
                  child: OrderItem(order: orders[index]),
                );
              },
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              child: Align(
                alignment: Alignment.center,
                child: Text(S.of(context).thereNotOrderStatus),
              ),
            ),
          );
  }
}
