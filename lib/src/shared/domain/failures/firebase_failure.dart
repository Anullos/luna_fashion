abstract class FirebaseFailure {
  const FirebaseFailure();
  factory FirebaseFailure.unknownError() = FirebaseFailureFailureUnknownError;

  void when({
    required void Function(FirebaseFailureFailureUnknownError) unknownError,
  }) {
    if (this is FirebaseFailureFailureUnknownError) {
      unknownError.call(this as FirebaseFailureFailureUnknownError);
    }

    unknownError.call(this as FirebaseFailureFailureUnknownError);
  }

  R map<R>({
    required R Function(FirebaseFailureFailureUnknownError) unknownError,
  }) {
    if (this is FirebaseFailureFailureUnknownError) {
      return unknownError.call(this as FirebaseFailureFailureUnknownError);
    }

    return unknownError.call(this as FirebaseFailureFailureUnknownError);
  }

  void maybeWhen({
    void Function(FirebaseFailureFailureUnknownError)? unknownError,
    required void Function() orElse,
  }) {
    if (this is FirebaseFailureFailureUnknownError && unknownError != null) {
      unknownError.call(this as FirebaseFailureFailureUnknownError);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(FirebaseFailureFailureUnknownError)? unknownError,
    required R Function() orElse,
  }) {
    if (this is FirebaseFailureFailureUnknownError && unknownError != null) {
      return unknownError.call(this as FirebaseFailureFailureUnknownError);
    }

    return orElse.call();
  }

  factory FirebaseFailure.fromString(String value) {
    if (value == 'UNKNOWN_ERROR') {
      return FirebaseFailure.unknownError();
    }

    return FirebaseFailure.unknownError();
  }

  @override
  String toString() {
    if (this is FirebaseFailureFailureUnknownError) {
      return 'UNKNOWN_ERROR';
    }

    return 'UNKNOWN_ERROR';
  }
}

class FirebaseFailureFailureUnknownError extends FirebaseFailure {}
