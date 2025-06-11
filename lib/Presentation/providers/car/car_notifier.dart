import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/Car.dart';

import '../../../Data/models/CarModel.dart';
import '../../../Domain/usecases/getCarsUseCase.dart';
import 'car_state.dart';

class carNotifier extends StateNotifier<carState>{
  final getCars getcars;
  final CreateCar createCarUsecase;
  final DeleteCar deleteCarUsecase;
  final EditCar editCarUsecase;

  carNotifier(this.getcars, this.createCarUsecase, this.deleteCarUsecase, this.editCarUsecase):super(carState());

  Future<void> getccars()async{
    try{
      state=state.copyWith(isLoading:true);
      final response=await getcars();
      print("int the notifier $response");
      state=state.copyWith(isLoading: false, result: response);
    }
    catch(e){
      state=state.copyWith(error: e.toString());
    }
  }

  Future<void> createCar(CarCreateRequest carData) async {
    try {
      state = state.copyWith(isLoading: true);
      final car = await createCarUsecase(carData);
      final List<CarModel> updatedList = List.of(state.result ?? [])..add(car);
      state = state.copyWith(isLoading: false, result: updatedList);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteCar(String id) async {
    try {
      state = state.copyWith(isLoading: true);
      await deleteCarUsecase(id);
      final updatedList = (state.result ?? []).where((car) => car.id != id).toList();
      state = state.copyWith(isLoading: false, result: updatedList);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> editCar(String id, Map<String, dynamic> updates) async {
    try {
      state = state.copyWith(isLoading: true);
      final updatedCar = await editCarUsecase(id, updates);
      final updatedList = (state.result ?? []).map((car) => car.id == id ? updatedCar : car).toList();
      state = state.copyWith(isLoading: false, result: updatedList);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}