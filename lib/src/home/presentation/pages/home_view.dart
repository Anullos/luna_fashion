import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_top_products.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: const [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: HomeAppBar(),
          ),
          HomeTopProducts(),
        ],
      ),
    );
  }
}
