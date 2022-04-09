import '../../../shared/presentation/utils/either.dart';
import '../../../shared/presentation/utils/value_object.dart';
import '../failures/name_failure.dart';

class NameVos extends ValueObject<NameFailure, String> {
  @override
  final Either<NameFailure, String> value;

  factory NameVos(String input) {
    return NameVos._(
      _validate(input.trim()),
    );
  }
  const NameVos._(this.value);

  static Either<NameFailure, String> _validate(String input) {
    const userNameRegex = r'^[ña-zÑA-ZÀ-ÿ]{2,}(?: [ña-zÑA-ZÀ-ÿ]+){0,3}$';

    if (input.isEmpty) {
      return left(NameFailure.empty());
    }

    if (!RegExp(userNameRegex).hasMatch(input)) {
      return left(NameFailure.invalid());
    }

    if (input.length > 30) {
      return left(NameFailure.tooLong(30));
    }

    return right(input);
  }
}
