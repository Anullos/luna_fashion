import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes.dart';
import '../../../shared/application/providers.dart';
import '../../../shared/domain/types/category_product_type.dart';
import '../../../shared/infrastructure/data/categories_data.dart';
import '../widgets/item_category.dart';
import '../widgets/item_product.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Consumer(builder: (_, ref, __) {
              final categorySelected = ref.watch(
                  productsController.select((value) => value.categorySelected));
              return Wrap(
                clipBehavior: Clip.none,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 8,
                spacing: 0,
                children: [
                  for (final category in categoriesApp)
                    ItemCategory(
                      category: category,
                      isSelected: categorySelected.toString() == category.id,
                      onTap: () => ref
                          .read(productsController.notifier)
                          .categoryChanged(
                              CategoryProductType.fromString(category.id)),
                    ),
                ],
              );
            }),
            const SizedBox(height: 16.0),
            Consumer(builder: (_, ref, __) {
              final streams = ref.watch(productsStream);
              return streams.when(
                data: (products) {
                  final categorySelected =
                      ref.watch(productsController).categorySelected;
                  final productsOfCategory = products
                      .where((product) =>
                          product.category.toString() ==
                          categorySelected.toString())
                      .toList();
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    shrinkWrap: true,
                    itemCount: productsOfCategory.length,
                    itemBuilder: (context, index) {
                      return ItemProduct(
                        product: productsOfCategory[index],
                        onTap: () => Navigator.pushNamed(context, productRoute,
                            arguments: productsOfCategory[index]),
                      );
                    },
                  );
                },
                error: (e, f) => const Text('Error con firebase'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
