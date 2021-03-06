import '../../../shared/presentation/utils/either.dart';
import '../../../shared/presentation/utils/value_object.dart';
import '../failures/repeat_password_failure.dart';

class RepeatPasswordVos extends ValueObject<RepeatPasswordFailure, String> {
  @override
  final Either<RepeatPasswordFailure, String> value;
  factory RepeatPasswordVos({
    required String password,
    required String passToMatchWith,
  }) =>
      RepeatPasswordVos._(
        _validate(
          password: password,
          passToMatchWith: passToMatchWith,
        ),
      );
  const RepeatPasswordVos._(this.value);

  static Either<RepeatPasswordFailure, String> _validate({
    required String password,
    required String passToMatchWith,
  }) {
    if (password != passToMatchWith) {
      return left(MismatchedPasswords());
    }

    return right(password);
  }
}
