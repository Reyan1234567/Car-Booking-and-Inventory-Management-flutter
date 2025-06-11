class Car {
  final String id;
  final String name;
  final String make;
  final String model;
  final int year;
  final String transmissionType;
  final String fuelType;
  final int passengerCapacity;
  final String luggageCapacity;
  final double dailyRate;
  final String plate;
  final String image;

  Car({
    required this.id,
    required this.name,
    required this.make,
    required this.model,
    required this.year,
    required this.transmissionType,
    required this.fuelType,
    required this.passengerCapacity,
    required this.luggageCapacity,
    required this.dailyRate,
    required this.plate,
    required this.image,
  });
}


class CarCreateRequest{
  final String name;
  final String make;
  final String model;
  final int year;
  final int price;
  final String transmissionType;
  final String fuelType;
  final int passengerCapacity;
  final String luggageCapacity;
  final double dailyRate;
  final String plate;
  final String image;

  CarCreateRequest(this.dailyRate, this.fuelType, this.image, this.luggageCapacity, this.make, this.model, this.name, this.passengerCapacity, this.plate, this.price, this.transmissionType, this.year);
}

class CarUpdate{
  final String? name;
  final String? make;
  final String? model;
  final int? year;
  final int? price;
  final String? transmissionType;
  final String? fuelType;
  final int? passengerCapacity;
  final String? luggageCapacity;
  final double? dailyRate;
  final String? plate;
  final String? image;

  CarUpdate(
      {this.name, this.make, this.model, this.year, this.price, this.transmissionType, this.fuelType, this.passengerCapacity, this.luggageCapacity, this.dailyRate, this.plate, this.image});
}
