import 'package:flutter/cupertino.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/failures/password_failure.dart';

extension PasswordFailureTranslation on PasswordFailure {
  String toTranslation(BuildContext context) {
    if (this is PasswordFailureEmpty) {
      return S.of(context).empty;
    }

    if (this is PasswordFailureInvalidMinLength) {
      return S.of(context).tooShot;
    }

    return S.of(context).empty;
  }
}
