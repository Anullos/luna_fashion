import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/domain/types/category_product_type.dart';
import '../../../shared/infrastructure/data/categories_data.dart';
import '../widgets/item_category.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 200,
                  color: index % 2 != 0 ? Colors.blue : Colors.red,
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
