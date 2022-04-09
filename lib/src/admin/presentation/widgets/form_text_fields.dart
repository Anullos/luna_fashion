import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/application/providers.dart';
import '../extensions/description_failure_extension.dart';
import '../extensions/name_failure_extension.dart';
import 'text_field_widget.dart';

class NameTextField extends ConsumerWidget {
  const NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(addProductController.select((value) => value.name));
    return TextFieldWidget(
      keyboardType: TextInputType.name,
      headerText: S.of(context).name,
      onChanged: ref.read(addProductController.notifier).nameChanged,
      showError: ref.watch(addProductController).showErrors,
      validator: (_) => name.map(
          isLeft: (f) => f.toTranslation(context), isRight: (_) => null),
    );
  }
}

class DescriptionTextField extends ConsumerWidget {
  const DescriptionTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description =
        ref.watch(addProductController.select((value) => value.description));
    return TextFieldWidget(
      keyboardType: TextInputType.name,
      headerText: S.of(context).description,
      showError: ref.watch(addProductController).showErrors,
      onChanged: ref.read(addProductController.notifier).descriptionChanged,
      validator: (_) => description.map(
          isLeft: (f) => f.toTranslation(context), isRight: (_) => null),
      maxLines: 4,
      maxLength: 200,
      
    );
  }
}
