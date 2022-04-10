abstract class PriceFailure {
  const PriceFailure();
  factory PriceFailure.isZero() = PriceFailureIsZero;
  factory PriceFailure.invalid() = PriceFailureInvalid;
  factory PriceFailure.negative(double value) = PriceFailureNegative;

  void when({
    required void Function(PriceFailureIsZero) isZero,
    required void Function(PriceFailureInvalid) invalid,
    required void Function(PriceFailureNegative) negative,
  }) {
    if (this is PriceFailureIsZero) {
      isZero.call(this as PriceFailureIsZero);
    }

    if (this is PriceFailureInvalid) {
      invalid.call(this as PriceFailureInvalid);
    }

    if (this is PriceFailureNegative) {
      negative.call(this as PriceFailureNegative);
    }

    isZero.call(this as PriceFailureIsZero);
  }

  R map<R>({
    required R Function(PriceFailureIsZero) isZero,
    required R Function(PriceFailureInvalid) invalid,
    required R Function(PriceFailureNegative) negative,
  }) {
    if (this is PriceFailureIsZero) {
      return isZero.call(this as PriceFailureIsZero);
    }

    if (this is PriceFailureInvalid) {
      return invalid.call(this as PriceFailureInvalid);
    }

    if (this is PriceFailureNegative) {
      return negative.call(this as PriceFailureNegative);
    }

    return isZero.call(this as PriceFailureIsZero);
  }

  void maybeWhen({
    void Function(PriceFailureIsZero)? isZero,
    void Function(PriceFailureInvalid)? invalid,
    void Function(PriceFailureNegative)? negative,
    required void Function() orElse,
  }) {
    if (this is PriceFailureIsZero && isZero != null) {
      isZero.call(this as PriceFailureIsZero);
    }

    if (this is PriceFailureInvalid && invalid != null) {
      invalid.call(this as PriceFailureInvalid);
    }

    if (this is PriceFailureNegative && negative != null) {
      negative.call(this as PriceFailureNegative);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(PriceFailureIsZero)? isZero,
    R Function(PriceFailureInvalid)? invalid,
    R Function(PriceFailureNegative)? negative,
    required R Function() orElse,
  }) {
    if (this is PriceFailureIsZero && isZero != null) {
      return isZero.call(this as PriceFailureIsZero);
    }

    if (this is PriceFailureInvalid && invalid != null) {
      return invalid.call(this as PriceFailureInvalid);
    }

    if (this is PriceFailureNegative && negative != null) {
      return negative.call(this as PriceFailureNegative);
    }

    return orElse.call();
  }

  factory PriceFailure.fromString(String value) {
    if (value == 'isZero') {
      return PriceFailure.isZero();
    }

    if (value == 'invalid') {
      return PriceFailure.invalid();
    }

    return PriceFailure.isZero();
  }

  @override
  String toString() {
    if (this is PriceFailureIsZero) {
      return 'isZero';
    }

    if (this is PriceFailureInvalid) {
      return 'invalid';
    }

    if (this is PriceFailureNegative) {
      return 'negative';
    }

    return 'isZero';
  }
}

class PriceFailureIsZero extends PriceFailure {}

class PriceFailureInvalid extends PriceFailure {}

class PriceFailureNegative extends PriceFailure {
  final double value;

  PriceFailureNegative(this.value);
}
