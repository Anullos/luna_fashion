import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../shared/domain/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(
      {Key? key, required this.product, required this.onDelete})
      : super(key: key);
  final ProductModel product;
  final Function(BuildContext) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.22,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          product.name,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Price: ${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('OldPrice: ${product.oldPrice.toStringAsFixed(2)}'),
          ],
        ),
        leading: Image.network(product.imageUrl),
        onTap: () {},
      ),
    );
  }
}
