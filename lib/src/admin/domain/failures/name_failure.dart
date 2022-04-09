abstract class NameFailure {
  const NameFailure();
  factory NameFailure.empty() = NameFailureEmpty;
  factory NameFailure.invalid() = NameFailureInvalid;
  factory NameFailure.tooLong(int length) = NameFailureTooLong;

  void when({
    required void Function(NameFailureEmpty) empty,
    required void Function(NameFailureInvalid) invalid,
    required void Function(NameFailureTooLong) tooLong,
  }) {
    if (this is NameFailureEmpty) {
      empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid) {
      invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureTooLong) {
      tooLong.call(this as NameFailureTooLong);
    }

    empty.call(this as NameFailureEmpty);
  }

  R map<R>({
    required R Function(NameFailureEmpty) empty,
    required R Function(NameFailureInvalid) invalid,
    required R Function(NameFailureTooLong) tooLong,
  }) {
    if (this is NameFailureEmpty) {
      return empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid) {
      return invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureTooLong) {
      return tooLong.call(this as NameFailureTooLong);
    }

    return empty.call(this as NameFailureEmpty);
  }

  void maybeWhen({
    void Function(NameFailureEmpty)? empty,
    void Function(NameFailureInvalid)? invalid,
    void Function(NameFailureTooLong)? tooLong,
    required void Function() orElse,
  }) {
    if (this is NameFailureEmpty && empty != null) {
      empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid && invalid != null) {
      invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureTooLong && tooLong != null) {
      tooLong.call(this as NameFailureTooLong);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(NameFailureEmpty)? empty,
    R Function(NameFailureInvalid)? invalid,
    R Function(NameFailureTooLong)? tooLong,
    required R Function() orElse,
  }) {
    if (this is NameFailureEmpty && empty != null) {
      return empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid && invalid != null) {
      return invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureTooLong && tooLong != null) {
      return tooLong.call(this as NameFailureTooLong);
    }

    return orElse.call();
  }

  factory NameFailure.fromString(String value) {
    if (value == 'empty') {
      return NameFailure.empty();
    }

    if (value == 'invalid') {
      return NameFailure.invalid();
    }

    return NameFailure.empty();
  }

  @override
  String toString() {
    if (this is NameFailureEmpty) {
      return 'empty';
    }

    if (this is NameFailureInvalid) {
      return 'invalid';
    }

    if (this is NameFailureTooLong) {
      return 'tooLong';
    }

    return 'empty';
  }
}

class NameFailureEmpty extends NameFailure {}

class NameFailureInvalid extends NameFailure {}

class NameFailureTooLong extends NameFailure {
  final int length;

  NameFailureTooLong(this.length);
}
