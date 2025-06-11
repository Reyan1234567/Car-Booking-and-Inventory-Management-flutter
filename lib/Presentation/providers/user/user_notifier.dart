import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/User.dart';
import 'package:flutterpolo/Data/models/UserModel.dart';
import 'package:flutterpolo/Domain/usecases/getUsersUseCase.dart';
import 'user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  final GetUsers _getUsersUseCase;
  final CreateUser createUserUsecase;
  final DeleteUser deleteUserUsecase;
  final EditUser editUserUsecase;

  UserNotifier(
    this._getUsersUseCase,
    this.createUserUsecase,
    this.deleteUserUsecase,
    this.editUserUsecase,
  ) : super(UserState());

  Future<void> getUsers() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _getUsersUseCase();
      state = state.copyWith(isLoading: false, users: response);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> createUser(UserCreateRequest userData) async {
    try {
      state = state.copyWith(isLoading: true);
      final user = await createUserUsecase(userData);
      final List<UserModel> updatedList = List.of(state.users ?? [])..add(user);
      state = state.copyWith(isLoading: false, users: updatedList);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      state = state.copyWith(isLoading: true);
      await deleteUserUsecase(id);
      final updatedList = (state.users ?? []).where((user) => user.id != id).toList();
      state = state.copyWith(isLoading: false, users: updatedList);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateUser(String id, UserUpdate updates) async {
    try {
      state = state.copyWith(isLoading: true);
      final updatedUser = await editUserUsecase(id, updates);
      final updatedList = (state.users ?? []).map((user) => user.id == id ? updatedUser : user).toList();
      state = state.copyWith(isLoading: false, users: updatedList);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}