import '../domain/example_meal_model.dart';
import '../domain/example_meal_detail_model.dart';
import '../domain/example_failure.dart';
import '../domain/example_category_model.dart';
import '../../shared/presentation/utils/resource.dart';
import '../domain/example_repository_interface.dart';

class ExampleRepositoryImplements extends ExampleRepositoryInterface {
  @override
  Future<Resource<ExampleFailure, List<ExampleCategoryModel>>>
      getListCategories() {
    throw UnimplementedError();
  }

  @override
  Future<Resource<ExampleFailure, ExampleMealDetailModel>> getMealById(
      String mealId) {
    throw UnimplementedError();
  }

  @override
  Future<Resource<ExampleFailure, List<ExampleMealModel>>> getMealsByCategory(
      String categoryId) {
    throw UnimplementedError();
  }
}
