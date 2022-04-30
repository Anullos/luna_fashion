import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../widgets/product_list_widget.dart';

class ProductsAdminView extends StatelessWidget {
  const ProductsAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              S.of(context).myProducts,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ProductListWidget(),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
