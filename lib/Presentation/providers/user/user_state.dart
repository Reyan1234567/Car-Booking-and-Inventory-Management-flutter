import 'package:flutterpolo/Data/models/UserModel.dart';

class UserState {
  bool? isLoading = false;
  final List<UserModel>? users;
  final String? error;

  UserState({this.isLoading, this.users, this.error});

  UserState copyWith({bool? isLoading, List<UserModel>? users, String? error}) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
} 