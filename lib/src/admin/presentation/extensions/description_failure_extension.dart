import 'package:flutter/cupertino.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/failures/description_failure.dart';

extension DescriptionFailureTranslation on DescriptionFailure {
  String toTranslation(BuildContext context) {
    if (this is DescriptionFailureEmpty) {
      return S.of(context).empty;
    }

    if (this is DescriptionFailureInvalid) {
      return S.of(context).invalidEmail;
    }

    if (this is DescriptionFailureTooLong) {
      return S.of(context).tooLong;
    }

    return S.of(context).empty;
  }
}
