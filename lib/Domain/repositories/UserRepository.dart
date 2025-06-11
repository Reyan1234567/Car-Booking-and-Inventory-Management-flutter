import 'package:flutterpolo/Domain/entities/User.dart';
import '../../Data/models/UserModel.dart';

abstract class UserRepository{
  Future<List<UserModel>> getUsers();
  Future<void> deleteUser(String id);
  Future<UserModel> createUser(UserCreateRequest userData);
  Future<UserModel> editUser(String id, UserUpdate updates);
} 