import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutterpolo/Data/models/UserModel.dart';
import 'package:flutterpolo/Domain/entities/User.dart';

class UsersDataSource{
  final DioClient _dio;

  UsersDataSource(this._dio);

  Future<List<UserModel>> getUsers() async{
    try{
      final List<dynamic> data = await _dio.get("http://localhost:4000/users");
      return data.map((user) => UserModel.fromJson(user)).toList();
    }
    on DioException catch(e){
      throw Exception(e.response?.data);
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _dio.delete("http://localhost:4000/user/$id");
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> createUser(UserCreateRequest userData) async {
    try {
      final response = await _dio.create(
        {
          "username": userData.username,
          "email": userData.email,
          "password": userData.password,
          "phoneNumber": userData.phoneNumber,
          "firstName": userData.firstName,
          "lastName": userData.lastName,
          "birthDate": userData.birthDate,
          "role": userData.role,
        },
        "http://localhost:4000/auth/signup",
      );
      return UserModel.fromJson(response);
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> editUser(String id, UserUpdate updates) async {
    try {
      Map<String, dynamic> jsonMap = {};
      if (updates.username != null) {
        jsonMap['username'] = updates.username;
      }
      if (updates.email != null) {
        jsonMap['email'] = updates.email;
      }
      if (updates.phoneNumber != null) {
        jsonMap['phoneNumber'] = updates.phoneNumber;
      }
      if (updates.firstName != null) {
        jsonMap['firstName'] = updates.firstName;
      }
      if (updates.lastName != null) {
        jsonMap['lastName'] = updates.lastName;
      }
      if (updates.profilePhoto != null) {
        jsonMap['profilePhoto'] = updates.profilePhoto;
      }
      if (updates.licensePhoto != null) {
        jsonMap['licensePhoto'] = updates.licensePhoto;
      }

      final response = await _dio.update(
        jsonMap,
        "http://localhost:4000/auth/updateAccount/$id",
      );
      return UserModel.fromJson(response['user']);
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}