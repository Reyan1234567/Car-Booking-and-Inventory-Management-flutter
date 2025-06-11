import 'package:flutterpolo/Domain/entities/User.dart';
import 'package:flutterpolo/Domain/repositories/UserRepository.dart';

import '../../Data/models/UserModel.dart';

class GetUsers{
  final UserRepository userRepo;

  GetUsers(this.userRepo);

  Future<List<UserModel>> call(){
    return userRepo.getUsers();
  }
}

class CreateUser {
  final UserRepository repo;
  CreateUser(this.repo);
  Future<UserModel> call(UserCreateRequest userData) => repo.createUser(userData);
}

class DeleteUser {
  final UserRepository repo;
  DeleteUser(this.repo);
  Future<void> call(String id) => repo.deleteUser(id);
}

class EditUser {
  final UserRepository repo;
  EditUser(this.repo);
  Future<UserModel> call(String id, UserUpdate updates) => repo.editUser(id, updates);
} 