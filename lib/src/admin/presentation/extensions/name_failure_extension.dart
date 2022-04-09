import 'package:flutter/cupertino.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/failures/name_failure.dart';

extension NameFailureTranslation on NameFailure {
  String toTranslation(BuildContext context) {
    if (this is NameFailureEmpty) {
      return S.of(context).empty;
    }

    if (this is NameFailureInvalid) {
      return S.of(context).invalidEmail;
    }

    if (this is NameFailureTooLong) {
      return S.of(context).tooLong;
    }

    return S.of(context).empty;
  }
}
