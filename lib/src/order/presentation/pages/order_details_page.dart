import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../domain/models/order_model.dart';
import '../extensions/order_status_extension.dart';
import '../widgets/item_product_detail.dart';
import '../widgets/resume_order.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LunaColors.nightMedium,
      appBar: AppBar(
        title: Text(S.of(context).orderDetails),
        backgroundColor: LunaColors.nightMedium,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).myProducts,
                style: TextStyle(fontSize: 20, color: LunaColors.white),
              ),
              // List of products
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: order.products.length,
                padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                itemBuilder: (context, index) {
                  return ItemProductDetail(
                    productItem: order.products[index],
                  );
                },
              ),
              const SizedBox(height: 20),
              // Resume
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    S.of(context).resume,
                    style: TextStyle(fontSize: 20, color: LunaColors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ResumeOrder(order: order),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Botton Order
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: LunaColors.orangeLight,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    S.of(context).status(order.status.toTranslation(context)),
                    style: TextStyle(color: LunaColors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
