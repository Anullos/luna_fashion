import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/infrastructure/data/categories_data.dart';
import '../widgets/item_category.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          return SizedBox(
            height: 130,
            child: ListView.builder(
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoriesApp.length,
              itemBuilder: (context, index) {
                final category = categoriesApp[index];
                return ItemCategory(
                  category: category,
                  index: index,
                  isSelected: categorySelected.toString() == category.id,
                  onTap: () => ref
                      .read(productsController.notifier)
                      .categoryChanged(index),
                );
              },
            ),
          );
        }),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 200,
                color: Colors.blue,
              );
            },
          ),
        ),
      ],
    );
  }
}
