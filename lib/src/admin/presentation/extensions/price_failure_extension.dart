import 'package:flutter/cupertino.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/failures/price_failure.dart';

extension PriceFailureTranslation on PriceFailure {
  String toTranslation(BuildContext context) {
    if (this is PriceFailureIsZero) {
      return S.of(context).empty;
    }

    if (this is PriceFailureInvalid) {
      return S.of(context).invalidEmail;
    }

    if (this is PriceFailureNegative) {
      return S.of(context).tooLong;
    }

    return S.of(context).empty;
  }
}
