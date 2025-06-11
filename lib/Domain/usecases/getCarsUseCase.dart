import 'package:flutterpolo/Domain/entities/Car.dart';
import 'package:flutterpolo/Domain/repositories/CarRepository.dart';

import '../../Data/models/CarModel.dart';

class getCars{
  final carRepository carRepo;

  getCars(this.carRepo);

  Future<List<CarModel>> call(){
    return carRepo.getCars();
  }
}

class CreateCar {
  final carRepository repo;
  CreateCar(this.repo);
  Future<CarModel> call(CarCreateRequest carData) => repo.createCar(carData);
}

class DeleteCar {
  final carRepository repo;
  DeleteCar(this.repo);
  Future<void> call(String id) => repo.deleteCar(id);
}

class EditCar {
  final carRepository repo;
  EditCar(this.repo);
  Future<CarModel> call(String id, CarUpdate updates) => repo.editCar(id, updates);
}