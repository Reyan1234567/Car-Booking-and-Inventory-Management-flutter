import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutterpolo/Data/datasources/login_datasource.dart';
import 'package:flutterpolo/Presentation/providers/login_notifier.dart';
import 'package:flutterpolo/Presentation/providers/login_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../Data/repositories/login_repositoryImpl.dart';
import '../../Domain/usecases/loginUsecase.dart';

final dioClientProvider=Provider<DioClient>((ref){
  return DioClient(Dio());
});
final loginDataSourceProvider=Provider<LoginDataSource>((ref){
  final dioC=ref.watch(dioClientProvider);
  return LoginDataSource(dioC);
});
final repositoryProvider=Provider<LoginRepositoryImpl>((ref){
  final loginData=ref.watch(loginDataSourceProvider);
  return LoginRepositoryImpl(loginData);
});
final getLoginProvider=Provider<Login>((ref){
  final repoProv=ref.watch(repositoryProvider);
  return Login(repoProv);
});

final loginNotifierProvider=
    StateNotifierProvider<LoginNotifier, LoginState>((ref){
      final login=ref.watch(getLoginProvider);
      return LoginNotifier(login);
    });