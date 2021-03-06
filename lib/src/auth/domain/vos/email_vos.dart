import '../../../shared/presentation/utils/either.dart';
import '../../../shared/presentation/utils/value_object.dart';
import '../failures/email_failure.dart';

class EmailVos extends ValueObject<EmailFailure, String> {
  @override
  final Either<EmailFailure, String> value;

  factory EmailVos(String input) {
    return EmailVos._(
      _validate(input.trim()),
    );
  }
  const EmailVos._(this.value);

  static Either<EmailFailure, String> _validate(String input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (input.isEmpty) {
      return left(EmailFailure.empty());
    }

    if (!RegExp(emailRegex).hasMatch(input)) {
      return left(EmailFailure.invalid());
    }

    return right(input);
  }
}
