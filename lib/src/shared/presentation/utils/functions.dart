import '../../../order/domain/models/product_order_model.dart';

String getTotalProducts(List<ProductOrderModel> products) {
  int counter = 0;
  for (var element in products) {
    counter += element.quantity;
  }
  return counter.toString();
}

String getTotalPayment(List<ProductOrderModel> products) {
  double counter = 0;
  for (var element in products) {
    counter += element.product.price * element.quantity;
  }
  return counter.toStringAsFixed(2);
}
