abstract class DescriptionFailure {
  const DescriptionFailure();
  factory DescriptionFailure.empty() = DescriptionFailureEmpty;
  factory DescriptionFailure.invalid() = DescriptionFailureInvalid;
  factory DescriptionFailure.tooLong(int length) = DescriptionFailureTooLong;

  void when({
    required void Function(DescriptionFailureEmpty) empty,
    required void Function(DescriptionFailureInvalid) invalid,
    required void Function(DescriptionFailureTooLong) tooLong,
  }) {
    if (this is DescriptionFailureEmpty) {
      empty.call(this as DescriptionFailureEmpty);
    }

    if (this is DescriptionFailureInvalid) {
      invalid.call(this as DescriptionFailureInvalid);
    }

    if (this is DescriptionFailureTooLong) {
      tooLong.call(this as DescriptionFailureTooLong);
    }

    empty.call(this as DescriptionFailureEmpty);
  }

  R map<R>({
    required R Function(DescriptionFailureEmpty) empty,
    required R Function(DescriptionFailureInvalid) invalid,
    required R Function(DescriptionFailureTooLong) tooLong,
  }) {
    if (this is DescriptionFailureEmpty) {
      return empty.call(this as DescriptionFailureEmpty);
    }

    if (this is DescriptionFailureInvalid) {
      return invalid.call(this as DescriptionFailureInvalid);
    }

    if (this is DescriptionFailureTooLong) {
      return tooLong.call(this as DescriptionFailureTooLong);
    }

    return empty.call(this as DescriptionFailureEmpty);
  }

  void maybeWhen({
    void Function(DescriptionFailureEmpty)? empty,
    void Function(DescriptionFailureInvalid)? invalid,
    void Function(DescriptionFailureTooLong)? tooLong,
    required void Function() orElse,
  }) {
    if (this is DescriptionFailureEmpty && empty != null) {
      empty.call(this as DescriptionFailureEmpty);
    }

    if (this is DescriptionFailureInvalid && invalid != null) {
      invalid.call(this as DescriptionFailureInvalid);
    }

    if (this is DescriptionFailureTooLong && tooLong != null) {
      tooLong.call(this as DescriptionFailureTooLong);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(DescriptionFailureEmpty)? empty,
    R Function(DescriptionFailureInvalid)? invalid,
    R Function(DescriptionFailureTooLong)? tooLong,
    required R Function() orElse,
  }) {
    if (this is DescriptionFailureEmpty && empty != null) {
      return empty.call(this as DescriptionFailureEmpty);
    }

    if (this is DescriptionFailureInvalid && invalid != null) {
      return invalid.call(this as DescriptionFailureInvalid);
    }

    if (this is DescriptionFailureTooLong && tooLong != null) {
      return tooLong.call(this as DescriptionFailureTooLong);
    }

    return orElse.call();
  }

  factory DescriptionFailure.fromString(String value) {
    if (value == 'empty') {
      return DescriptionFailure.empty();
    }

    if (value == 'invalid') {
      return DescriptionFailure.invalid();
    }

    return DescriptionFailure.empty();
  }

  @override
  String toString() {
    if (this is DescriptionFailureEmpty) {
      return 'empty';
    }

    if (this is DescriptionFailureInvalid) {
      return 'invalid';
    }

    if (this is DescriptionFailureTooLong) {
      return 'tooLong';
    }

    return 'empty';
  }
}

class DescriptionFailureEmpty extends DescriptionFailure {}

class DescriptionFailureInvalid extends DescriptionFailure {}

class DescriptionFailureTooLong extends DescriptionFailure {
  final int length;

  DescriptionFailureTooLong(this.length);
}
