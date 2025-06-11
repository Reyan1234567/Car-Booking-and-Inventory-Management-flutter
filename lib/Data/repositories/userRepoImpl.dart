import 'package:flutterpolo/Data/models/UserModel.dart';
import 'package:flutterpolo/Domain/entities/User.dart';
import 'package:flutterpolo/Domain/repositories/UserRepository.dart';

import '../datasources/users_datasource.dart';

class userRepoImpl extends UserRepository{
  final UsersDataSource usersDataS;

  userRepoImpl(this.usersDataS);

  @override
  Future<List<UserModel>> getUsers() async {
    try{
      final response= await usersDataS.getUsers();
      return response;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    await usersDataS.deleteUser(id);
  }

  @override
  Future<UserModel> createUser(UserCreateRequest userData) async {
    return await usersDataS.createUser(userData);
  }

  @override
  Future<UserModel> editUser(String id, UserUpdate updates) async {
    return await usersDataS.editUser(id, updates);
  }
} 