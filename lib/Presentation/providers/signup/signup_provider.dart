import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutterpolo/Data/datasources/signup_datasource.dart';
import 'package:flutterpolo/Data/repositories/signup_repositoryImpl.dart';
import 'package:flutterpolo/Domain/usecases/SignupUsecase.dart';
import 'package:flutterpolo/Presentation/providers/signup/signup_notifier.dart';
import 'package:flutterpolo/Presentation/providers/signup/signup_state.dart';

final dioClientProvider=Provider<DioClient>((ref){
  return DioClient();
});

final dataSourcee=Provider<SignupDatasource>((ref){
  final dioC=ref.watch(dioClientProvider);
  return SignupDatasource(dioC);
});

final reporitoryImplProvider=Provider<SignupRepositoryImpl>((ref){
    final dataSource=ref.watch(dataSourcee);
    return SignupRepositoryImpl(dataSource);
});

final useCaseProvider=Provider<SignupUsecase>((ref){
  final repoIml=ref.watch(reporitoryImplProvider);
  return SignupUsecase(repoIml);
});

final SignupNotifierProvider=StateNotifierProvider<SignupNotifier, SignupState>((ref){
  final usecase=ref.watch(useCaseProvider);
  return SignupNotifier(usecase);
});