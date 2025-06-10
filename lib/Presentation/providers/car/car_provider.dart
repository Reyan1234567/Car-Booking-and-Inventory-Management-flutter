import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/datasources/cars_datasource.dart';
import 'package:flutterpolo/Data/repositories/carRepoImpl.dart';
import 'package:flutterpolo/Domain/usecases/getCarsUseCase.dart';
import 'package:flutterpolo/Presentation/providers/car/car_notifier.dart';
import 'package:flutterpolo/Presentation/providers/car/car_state.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final carsDataSourceProvider = Provider<CarsDataSource>((ref) {
  final dioC = ref.watch(dioClientProvider);
  return CarsDataSource(dioC);
});

final carRepoProvider = Provider<carRepoImpl>((ref) {
  final carsDataSource = ref.watch(carsDataSourceProvider);
  return carRepoImpl(carsDataSource);
});

final getCarsUseCaseProvider = Provider<getCars>((ref) {
  final carRepo = ref.watch(carRepoProvider);
  return getCars(carRepo);
});

final carNotifierProvider = StateNotifierProvider<carNotifier, carState>((ref) {
  final getCarsUsecase = ref.watch(getCarsUseCaseProvider);
  return carNotifier(getCarsUsecase);
});
