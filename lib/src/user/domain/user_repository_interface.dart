import '../../shared/domain/models/user_model.dart';

abstract class UserRepositoryInterface {
  Stream<UserModel> getUser();
}
