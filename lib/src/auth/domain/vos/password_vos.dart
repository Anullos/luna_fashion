import '../../../shared/presentation/utils/either.dart';
import '../../../shared/presentation/utils/value_object.dart';
import '../failures/password_failure.dart';

class PasswordVos extends ValueObject<PasswordFailure, String> {
  @override
  final Either<PasswordFailure, String> value;
  factory PasswordVos(String input) {
    return PasswordVos._(
      _validate(input.trim()),
    );
  }
  const PasswordVos._(this.value);

  static Either<PasswordFailure, String> _validate(String input) {
    if (input.isEmpty) {
      return left(PasswordFailure.empty());
    }

    if (input.length < 6) {
      return left(PasswordFailure.minLength(6));
    }

    return right(input);
  }
}
