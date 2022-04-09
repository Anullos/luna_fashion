import '../../../shared/presentation/utils/either.dart';
import '../../../shared/presentation/utils/value_object.dart';
import '../failures/description_failure.dart';

class DescriptionVos extends ValueObject<DescriptionFailure, String> {
  @override
  final Either<DescriptionFailure, String> value;

  factory DescriptionVos(String input) {
    return DescriptionVos._(
      _validate(input.trim()),
    );
  }
  const DescriptionVos._(this.value);

  static Either<DescriptionFailure, String> _validate(String input) {
    const regex = r'^[ña-zÑA-ZÀ-ÿ]{2,}(?: [ña-zÑA-ZÀ-ÿ]+){0,3}$';

    if (input.isEmpty) {
      return left(DescriptionFailure.empty());
    }

    if (!RegExp(regex).hasMatch(input)) {
      return left(DescriptionFailure.invalid());
    }

    if (input.length > 200) {
      return left(DescriptionFailure.tooLong(200));
    }

    return right(input);
  }
}
