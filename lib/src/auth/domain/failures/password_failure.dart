abstract class PasswordFailure {
  const PasswordFailure();
  factory PasswordFailure.empty() = PasswordFailureEmpty;
  factory PasswordFailure.minLength(int min) = PasswordFailureInvalidMinLength;

  void when({
    required void Function(PasswordFailureEmpty) empty,
    required void Function(PasswordFailureInvalidMinLength) minLength,
  }) {
    if (this is PasswordFailureEmpty) {
      empty.call(this as PasswordFailureEmpty);
    }

    if (this is PasswordFailureInvalidMinLength) {
      minLength.call(this as PasswordFailureInvalidMinLength);
    }

    empty.call(this as PasswordFailureEmpty);
  }

  R map<R>({
    required R Function(PasswordFailureEmpty) empty,
    required R Function(PasswordFailureInvalidMinLength) minLength,
  }) {
    if (this is PasswordFailureEmpty) {
      return empty.call(this as PasswordFailureEmpty);
    }

    if (this is PasswordFailureInvalidMinLength) {
      return minLength.call(this as PasswordFailureInvalidMinLength);
    }

    return empty.call(this as PasswordFailureEmpty);
  }

  void maybeWhen({
    void Function(PasswordFailureEmpty)? empty,
    void Function(PasswordFailureInvalidMinLength)? minLength,
    required void Function() orElse,
  }) {
    if (this is PasswordFailureEmpty && empty != null) {
      empty.call(this as PasswordFailureEmpty);
    }

    if (this is PasswordFailureInvalidMinLength && minLength != null) {
      minLength.call(this as PasswordFailureInvalidMinLength);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(PasswordFailureEmpty)? empty,
    R Function(PasswordFailureInvalidMinLength)? minLength,
    required R Function() orElse,
  }) {
    if (this is PasswordFailureEmpty && empty != null) {
      return empty.call(this as PasswordFailureEmpty);
    }

    if (this is PasswordFailureInvalidMinLength && minLength != null) {
      return minLength.call(this as PasswordFailureInvalidMinLength);
    }

    return orElse.call();
  }

  factory PasswordFailure.fromString(String value) {
    if (value == 'empty') {
      return PasswordFailure.empty();
    }

    return PasswordFailure.empty();
  }

  @override
  String toString() {
    if (this is PasswordFailureEmpty) {
      return 'empty';
    }

    if (this is PasswordFailureInvalidMinLength) {
      return 'minLength';
    }

    return 'empty';
  }
}

class PasswordFailureEmpty extends PasswordFailure {}

class PasswordFailureInvalidMinLength extends PasswordFailure {
  final int min;

  PasswordFailureInvalidMinLength(this.min);
}
