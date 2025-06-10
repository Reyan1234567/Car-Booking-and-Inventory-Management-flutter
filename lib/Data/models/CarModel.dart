import '../../Domain/entities/Car.dart';

class CarModel extends Car{
  CarModel({required super.id, required super.name, required super.make, required super.model, required super.year, required super.transmissionType, required super.fuelType, required super.passengerCapacity, required super.luggageCapacity, required super.dailyRate, required super.plate, required super.image});

  factory CarModel.fromJson(Map<String, dynamic> json){
    return CarModel(id: json['_id'], name: json['name'], make: json['make'], model: json['model'], year: json['year'], transmissionType: json['transmissionType'], fuelType: json['fuelType'], passengerCapacity: json['passengerCapacity'], luggageCapacity: json['luggageCapacity'], dailyRate: json['dailyRate'], plate: json['plate'], image: json['image']??"");
  }
}