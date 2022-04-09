import 'package:flutter/material.dart';

class PageViewEmpty extends StatelessWidget {
  const PageViewEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
