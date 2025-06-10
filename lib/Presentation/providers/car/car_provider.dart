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

final createCarUseCaseProvider = Provider<CreateCar>((ref) {
  final carRepo = ref.watch(carRepoProvider);
  return CreateCar(carRepo);
});

final deleteCarUseCaseProvider = Provider<DeleteCar>((ref) {
  final carRepo = ref.watch(carRepoProvider);
  return DeleteCar(carRepo);
});

final editCarUseCaseProvider = Provider<EditCar>((ref) {
  final carRepo = ref.watch(carRepoProvider);
  return EditCar(carRepo);
});

final carNotifierProvider = StateNotifierProvider<carNotifier, carState>((ref) {
  final getCarsUsecase = ref.watch(getCarsUseCaseProvider);
  final createCarUsecase = ref.watch(createCarUseCaseProvider);
  final deleteCarUsecase = ref.watch(deleteCarUseCaseProvider);
  final editCarUsecase = ref.watch(editCarUseCaseProvider);
  return carNotifier(getCarsUsecase, createCarUsecase, deleteCarUsecase, editCarUsecase);
});
