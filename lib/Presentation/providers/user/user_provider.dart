import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/datasources/users_datasource.dart';
import 'package:flutterpolo/Data/repositories/userRepoImpl.dart';
import 'package:flutterpolo/Domain/usecases/getUsersUseCase.dart';
import 'package:flutterpolo/Presentation/providers/user/user_notifier.dart';
import 'package:flutterpolo/Presentation/providers/user/user_state.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final usersDataSourceProvider = Provider<UsersDataSource>((ref) {
  final dioC = ref.watch(dioClientProvider);
  return UsersDataSource(dioC);
});

final userRepoProvider = Provider<userRepoImpl>((ref) {
  final usersDataSource = ref.watch(usersDataSourceProvider);
  return userRepoImpl(usersDataSource);
});

final getUsersUseCaseProvider = Provider<GetUsers>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return GetUsers(userRepo);
});

final createUserUseCaseProvider = Provider<CreateUser>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return CreateUser(userRepo);
});

final deleteUserUseCaseProvider = Provider<DeleteUser>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return DeleteUser(userRepo);
});

final editUserUseCaseProvider = Provider<EditUser>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return EditUser(userRepo);
});

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final getUsersUsecase = ref.watch(getUsersUseCaseProvider);
  final createUserUsecase = ref.watch(createUserUseCaseProvider);
  final deleteUserUsecase = ref.watch(deleteUserUseCaseProvider);
  final editUserUsecase = ref.watch(editUserUseCaseProvider);
  return UserNotifier(getUsersUsecase, createUserUsecase, deleteUserUsecase, editUserUsecase);
}); 