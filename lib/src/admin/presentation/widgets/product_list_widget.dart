import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/domain/models/product_model.dart';
import 'product_item_widget.dart';

class ProductListWidget extends ConsumerWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productsList);
    return productAsync.when(
      data: (products) => _buildList(context, products, ref),
      error: (error, _) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildList(
      BuildContext context, List<ProductModel> products, WidgetRef ref) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItemWidget(
          product: product,
          onDelete: (_) =>
              ref.read(addProductController.notifier).deleteProduct(product.id),
        );
      },
    );
  }
}
