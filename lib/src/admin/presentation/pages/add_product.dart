import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';
import '../widgets/form_text_fields.dart';
import '../widgets/image_selector_widget.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addProduct),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ImageSelectorWidget(),
              const NameTextField(),
              const DescriptionTextField(),
              const SizedBox(height: 40),
              Consumer(builder: (_, ref, __) {
                return CustomButtonWidget(
                  isLoading: false,
                  text: S.of(context).add,
                  onTap: ref.read(addProductController.notifier).addProduct,
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
