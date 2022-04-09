abstract class ExampleFailure {
  const ExampleFailure();
  factory ExampleFailure.unknownError() = ExampleFailureFailureUnknownError;

  void when({
    required void Function(ExampleFailureFailureUnknownError) unknownError,
  }) {
    if (this is ExampleFailureFailureUnknownError) {
      unknownError.call(this as ExampleFailureFailureUnknownError);
    }

    unknownError.call(this as ExampleFailureFailureUnknownError);
  }

  R map<R>({
    required R Function(ExampleFailureFailureUnknownError) unknownError,
  }) {
    if (this is ExampleFailureFailureUnknownError) {
      return unknownError.call(this as ExampleFailureFailureUnknownError);
    }

    return unknownError.call(this as ExampleFailureFailureUnknownError);
  }

  void maybeWhen({
    void Function(ExampleFailureFailureUnknownError)? unknownError,
    required void Function() orElse,
  }) {
    if (this is ExampleFailureFailureUnknownError && unknownError != null) {
      unknownError.call(this as ExampleFailureFailureUnknownError);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(ExampleFailureFailureUnknownError)? unknownError,
    required R Function() orElse,
  }) {
    if (this is ExampleFailureFailureUnknownError && unknownError != null) {
      return unknownError.call(this as ExampleFailureFailureUnknownError);
    }

    return orElse.call();
  }

  factory ExampleFailure.fromString(String value) {
    if (value == 'UNKNOWN_ERROR') {
      return ExampleFailure.unknownError();
    }

    return ExampleFailure.unknownError();
  }

  @override
  String toString() {
    if (this is ExampleFailureFailureUnknownError) {
      return 'UNKNOWN_ERROR';
    }

    return 'UNKNOWN_ERROR';
  }
}

class ExampleFailureFailureUnknownError extends ExampleFailure {}
