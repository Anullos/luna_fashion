import 'package:flutter/widgets.dart';

import '../l10n/generated/l10n.dart';
import 'value_object.dart';

extension ContextExtension on BuildContext {
  S get l10n => S.of(this);
}

extension IterableOfValueObject on Iterable<ValueObject> {
  bool get areValid => every((element) => element.isValid());
}
