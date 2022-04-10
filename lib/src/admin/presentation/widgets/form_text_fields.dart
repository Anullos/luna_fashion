import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/domain/types/category_product_type.dart';
import '../../../shared/infrastructure/data/categories_data.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/application/providers.dart';
import '../extensions/description_failure_extension.dart';
import '../extensions/name_failure_extension.dart';
import '../extensions/price_failure_extension.dart';
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

class CategorySelector extends ConsumerWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categ =
        ref.watch(addProductController.select((value) => value.category));
    return ListTile(
      title: Text('${S.of(context).category}: '),
      contentPadding: EdgeInsets.zero,
      trailing: DropdownButton<String>(
        value: categ.toString(),
        items: categoriesApp
            .map((category) => DropdownMenuItem(
                  child: Text(category.getName(
                      ref.read(localizationController).locale.languageCode)),
                  value: category.id,
                ))
            .toList(),
        onChanged: (value) => ref
            .read(addProductController.notifier)
            .categoryChanged(CategoryProductType.fromString(value!)),
      ),
    );
  }
}

class PriceTextField extends ConsumerWidget {
  const PriceTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPrice =
        ref.watch(addProductController.select((value) => value.price));
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      headerText: S.of(context).price,
      onChanged: (value) => value != ''
          ? ref
              .read(addProductController.notifier)
              .priceChanged(double.parse(value))
          : ref.read(addProductController.notifier).priceChanged(0.0),
      showError: ref.watch(addProductController).showErrors,
      validator: (_) => newPrice.map(
          isLeft: (f) => f.toTranslation(context), isRight: (_) => null),
    );
  }
}

class OldPriceTextField extends ConsumerWidget {
  const OldPriceTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oldPrice =
        ref.watch(addProductController.select((value) => value.oldPrice));
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      headerText: S.of(context).oldPrice,
      onChanged: (value) => value != ''
          ? ref
              .read(addProductController.notifier)
              .oldPriceChanged(double.parse(value))
          : ref.read(addProductController.notifier).oldPriceChanged(0.0),
      showError: ref.watch(addProductController).showErrors,
      validator: (_) => oldPrice.map(
          isLeft: (f) => f.toTranslation(context), isRight: (_) => null),
    );
  }
}
