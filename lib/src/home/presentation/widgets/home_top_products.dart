import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

import '../../../../routes.dart';
import '../../../shared/infrastructure/data/products_data.dart';
import 'item_top_product.dart';

class HomeTopProducts extends StatefulWidget {
  const HomeTopProducts({Key? key}) : super(key: key);

  @override
  State<HomeTopProducts> createState() => _HomeTopProductsState();
}

class _HomeTopProductsState extends State<HomeTopProducts> {
  final _pageController = PageController(viewportFraction: 0.78);
  final _pageNotifier = ValueNotifier(0.0);

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  void _listener() {
    _pageNotifier.value = _pageController.page!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: 0,
            left: 20,
            child: Text(
              'Top Products of the Week',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 380,
            child: PageView.builder(
              controller: _pageController,
              itemCount: productsListData.length,
              itemBuilder: (context, index) {
                final product = productsListData[index];

                final t = (index - _pageNotifier.value);
                final rotationY = lerpDouble(0, 90, t)!;
                final translationX = lerpDouble(0, -50, t);
                final scale = lerpDouble(0, -0.2, t)!;
                final translationXShoes = lerpDouble(0, 150, t);
                final rotationShoe = lerpDouble(0, -45, t)!;
                final transform = Matrix4.identity();
                transform.translate(translationX);
                transform.setEntry(3, 2, 0.001);
                transform.scale(1 - scale);
                transform.rotateY(vector.radians(rotationY));

                final transformProduct = Matrix4.identity();
                transformProduct.translate(translationXShoes);
                transformProduct.rotateZ(vector.radians(rotationShoe));

                return ItemTopProduct(
                  product: product,
                  transform: transform,
                  transformProduct: transformProduct,
                  onTap: () => Navigator.pushNamed(context, productRoute,
                      arguments: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final colors = [
  Colors.blue,
  Colors.accents,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.brown,
  Colors.grey,
  Colors.teal,
  Colors.indigo,
  Colors.lime,
  Colors.cyan,
  Colors.lightBlue,
  Colors.limeAccent,
  Colors.deepOrange,
];
