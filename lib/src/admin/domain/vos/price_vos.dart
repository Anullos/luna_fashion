import '../../../shared/presentation/utils/either.dart';
import '../../../shared/presentation/utils/value_object.dart';
import '../failures/price_failure.dart';

class PriceVos extends ValueObject<PriceFailure, double> {
  @override
  final Either<PriceFailure, double> value;

  factory PriceVos(double input) {
    return PriceVos._(
      _validate(input),
    );
  }
  const PriceVos._(this.value);

  static Either<PriceFailure, double> _validate(double input) {
    if (input == 0.0) {
      return left(PriceFailure.isZero());
    }

    if (input < 0) {
      return left(PriceFailure.negative(0));
    }

    return right(input);
  }
}
