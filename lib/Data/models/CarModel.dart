import '../../Domain/entities/Car.dart';

class CarModel extends Car{
  CarModel({required super.id, required super.name, required super.make, required super.price, required super.model, required super.year, required super.category, required super.transmissionType, required super.fuelType, required super.passengerCapacity, required super.luggageCapacity, required super.imageUrl, required super.dailyRate, required super.hourlyRate, required super.plate, required super.image});

  factory CarModel.fromJson(Map<String, dynamic> json){
    return CarModel(id: json['id'], name: json['name'], make: json['make'], price: json['price'], model: json['model'], year: json['year'], category: json['category'], transmissionType: json['transmissionType'], fuelType: json['fuelType'], passengerCapacity: json['passengerCapacity'], luggageCapacity: json['luggageCapacity'], imageUrl: json['imageUrl'], dailyRate: json['dailyRate'], hourlyRate: json['hourlyRate'], plate: json['plate'], image: json['image']);
  }
}