import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addProduct),
        centerTitle: true,
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
