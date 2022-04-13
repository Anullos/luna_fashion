import 'package:flutter/material.dart';

import '../widgets/product_list_widget.dart';

class ProductsAdminView extends StatelessWidget {
  const ProductsAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'ProductsView',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ProductListWidget(),
      ],
    );
  }
}
