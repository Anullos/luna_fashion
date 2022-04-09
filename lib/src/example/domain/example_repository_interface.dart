import '../../shared/presentation/utils/resource.dart';
import 'example_category_model.dart';
import 'example_failure.dart';
import 'example_meal_detail_model.dart';
import 'example_meal_model.dart';

abstract class ExampleRepositoryInterface {
  Future<Resource<ExampleFailure, List<ExampleCategoryModel>>>
      getListCategories();
  Future<Resource<ExampleFailure, List<ExampleMealModel>>> getMealsByCategory(
      String categoryId);
  Future<Resource<ExampleFailure, ExampleMealDetailModel>> getMealById(
      String mealId);
}
