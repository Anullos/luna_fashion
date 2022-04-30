import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../order/domain/models/order_model.dart';
import '../../../order/domain/types/order_status_type.dart';
import '../../../order/presentation/extensions/order_status_extension.dart';
import '../../../order/presentation/widgets/item_product_detail.dart';
import '../../../order/presentation/widgets/resume_order.dart';
import '../../../shared/application/providers.dart';
import '../../../shared/domain/failures/firebase_failure.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/utils/result_or.dart';
import '../../../shared/presentation/utils/toasts.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';

class OrderDetailsAdminPage extends StatelessWidget {
  const OrderDetailsAdminPage({Key? key, required this.order})
      : super(key: key);
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
                S.of(context).realiceBy,
                style: TextStyle(fontSize: 20, color: LunaColors.white),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    order.userFullName,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
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
              Consumer(builder: (_, ref, __) {
                ref.listen<ResultOr<FirebaseFailure>>(
                  updateOrderNotifier,
                  (_, next) {
                    next
                      ..whenIsSuccess(() {
                        Navigator.pop(context);
                        showSuccess(context, message: S.of(context).completed);
                      })
                      ..whenIsFailure(
                        (failure) => showError(
                          context,
                          message: failure.map(
                            unknownError: (_) => S.of(context).unknownError,
                          ),
                        ),
                      );
                  },
                );

                return _getButtonOrder(context, ref, order);
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getButtonOrder(
      BuildContext context, WidgetRef ref, OrderModel order) {
    if (order.status is OrderStatusTypePending) {
      return Center(
        child: CustomButtonWidget(
          isLoading: ref.watch(updateOrderNotifier).isLoading,
          text: S.of(context).goToPickUp,
          onTap: () => ref
              .read(updateOrderNotifier.notifier)
              .addProduct(order.id, OrderStatusType.pickUp()),
        ),
      );
    }

    if (order.status is OrderStatusTypePickUp) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButtonWidget(
            isLoading: ref.watch(updateOrderNotifier).isLoading,
            text: S.of(context).rejected,
            onTap: () => ref
                .read(updateOrderNotifier.notifier)
                .addProduct(order.id, OrderStatusType.rejected()),
            background: LunaColors.orange,
          ),
          CustomButtonWidget(
            isLoading: ref.watch(updateOrderNotifier).isLoading,
            text: S.of(context).completed,
            onTap: () => ref
                .read(updateOrderNotifier.notifier)
                .addProduct(order.id, OrderStatusType.completed()),
          ),
        ],
      );
    }

    if (order.status is OrderStatusTypeCompleted) {
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: LunaColors.orangeLight,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            S.of(context).status(order.status.toTranslation(context)),
            style: TextStyle(color: LunaColors.white, fontSize: 20),
          ),
        ),
      );
    }

    if (order.status is OrderStatusTypeRejected) {
      return Center(
        child: CustomButtonWidget(
          isLoading: ref.watch(updateOrderNotifier).isLoading,
          text: S.of(context).goToCompleted,
          onTap: () => ref
              .read(updateOrderNotifier.notifier)
              .addProduct(order.id, OrderStatusType.completed()),
        ),
      );
    }

    return Container();
  }
}
