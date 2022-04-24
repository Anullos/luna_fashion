abstract class OrderStatusType {
  const OrderStatusType();
  factory OrderStatusType.pending() = OrderStatusTypePending;
  factory OrderStatusType.rejected() = OrderStatusTypeRejected;
  factory OrderStatusType.pickUp() = OrderStatusTypePickUp;
  factory OrderStatusType.completed() = OrderStatusTypeCompleted;

  void when({
    required void Function(OrderStatusTypePending) pending,
    required void Function(OrderStatusTypeRejected) rejected,
    required void Function(OrderStatusTypePickUp) pickUp,
    required void Function(OrderStatusTypeCompleted) completed,
  }) {
    if (this is OrderStatusTypePending) {
      pending.call(this as OrderStatusTypePending);
    }

    if (this is OrderStatusTypeRejected) {
      rejected.call(this as OrderStatusTypeRejected);
    }

    if (this is OrderStatusTypePickUp) {
      pickUp.call(this as OrderStatusTypePickUp);
    }

    if (this is OrderStatusTypeCompleted) {
      completed.call(this as OrderStatusTypeCompleted);
    }

    pending.call(this as OrderStatusTypePending);
  }

  R map<R>({
    required R Function(OrderStatusTypePending) pending,
    required R Function(OrderStatusTypeRejected) rejected,
    required R Function(OrderStatusTypePickUp) pickUp,
    required R Function(OrderStatusTypeCompleted) completed,
  }) {
    if (this is OrderStatusTypePending) {
      return pending.call(this as OrderStatusTypePending);
    }

    if (this is OrderStatusTypeRejected) {
      return rejected.call(this as OrderStatusTypeRejected);
    }

    if (this is OrderStatusTypePickUp) {
      return pickUp.call(this as OrderStatusTypePickUp);
    }

    if (this is OrderStatusTypeCompleted) {
      return completed.call(this as OrderStatusTypeCompleted);
    }

    return pending.call(this as OrderStatusTypePending);
  }

  void maybeWhen({
    void Function(OrderStatusTypePending)? pending,
    void Function(OrderStatusTypeRejected)? rejected,
    void Function(OrderStatusTypePickUp)? pickUp,
    void Function(OrderStatusTypeCompleted)? completed,
    required void Function() orElse,
  }) {
    if (this is OrderStatusTypePending && pending != null) {
      pending.call(this as OrderStatusTypePending);
    }

    if (this is OrderStatusTypeRejected && rejected != null) {
      rejected.call(this as OrderStatusTypeRejected);
    }

    if (this is OrderStatusTypePickUp && pickUp != null) {
      pickUp.call(this as OrderStatusTypePickUp);
    }

    if (this is OrderStatusTypeCompleted && completed != null) {
      completed.call(this as OrderStatusTypeCompleted);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(OrderStatusTypePending)? pending,
    R Function(OrderStatusTypeRejected)? rejected,
    R Function(OrderStatusTypePickUp)? pickUp,
    R Function(OrderStatusTypeCompleted)? completed,
    required R Function() orElse,
  }) {
    if (this is OrderStatusTypePending && pending != null) {
      return pending.call(this as OrderStatusTypePending);
    }

    if (this is OrderStatusTypeRejected && rejected != null) {
      return rejected.call(this as OrderStatusTypeRejected);
    }

    if (this is OrderStatusTypePickUp && pickUp != null) {
      return pickUp.call(this as OrderStatusTypePickUp);
    }

    if (this is OrderStatusTypeCompleted && completed != null) {
      return completed.call(this as OrderStatusTypeCompleted);
    }

    return orElse.call();
  }

  factory OrderStatusType.fromString(String value) {
    if (value == 'PENDING') {
      return OrderStatusType.pending();
    }

    if (value == 'REJECTED') {
      return OrderStatusType.rejected();
    }

    if (value == 'PICK_UP') {
      return OrderStatusType.pickUp();
    }

    if (value == 'COMPLETED') {
      return OrderStatusType.completed();
    }

    return OrderStatusType.pending();
  }

  @override
  String toString() {
    if (this is OrderStatusTypePending) {
      return 'PENDING';
    }

    if (this is OrderStatusTypeRejected) {
      return 'REJECTED';
    }

    if (this is OrderStatusTypePickUp) {
      return 'PICK_UP';
    }

    if (this is OrderStatusTypeCompleted) {
      return 'COMPLETED';
    }

    return 'PENDING';
  }
}

class OrderStatusTypePending extends OrderStatusType {}

class OrderStatusTypeRejected extends OrderStatusType {}

class OrderStatusTypePickUp extends OrderStatusType {}

class OrderStatusTypeCompleted extends OrderStatusType {}
