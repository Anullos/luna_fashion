import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/types/order_status_type.dart';

extension OrderStatusTranslation on OrderStatusType {
  String toTranslation(BuildContext context) {
    if (this is OrderStatusTypePending) {
      return S.of(context).pending;
    }

    if (this is OrderStatusTypePickUp) {
      return S.of(context).pickUp;
    }

    if (this is OrderStatusTypeRejected) {
      return S.of(context).rejected;
    }

    if (this is OrderStatusTypeCompleted) {
      return S.of(context).completed;
    }

    return S.of(context).empty;
  }

  Color getColor() {
    if (this is OrderStatusTypePending) {
      return Colors.orange;
    }

    if (this is OrderStatusTypePickUp) {
      return Colors.purpleAccent;
    }

    if (this is OrderStatusTypeRejected) {
      return Colors.red;
    }

    if (this is OrderStatusTypeCompleted) {
      return Colors.green;
    }

    return Colors.black;
  }
}
