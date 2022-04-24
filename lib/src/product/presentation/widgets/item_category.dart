import 'package:flutter/material.dart';

import '../../../shared/domain/models/category_product_app_model.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final CategoryProductAppModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      //      left: index == 0 ? 20 : 0,
      //      right: (index == categoriesApp.length - 1) ? 20 : 16.0),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          // height: 120,
          // width: 100,
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.blue,
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor:
                    isSelected ? Colors.green.shade800 : Colors.blue.shade800,
                radius: 30,
                child: Image.asset(
                  category.pictureUrl,
                  fit: BoxFit.fill,
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
              ),
              // const SizedBox(height: 8),
              // Consumer(builder: (_, ref, __) {
              //   return Text(
              //     category.getName(
              //         ref.watch(localizationController).locale.languageCode),
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   );
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
