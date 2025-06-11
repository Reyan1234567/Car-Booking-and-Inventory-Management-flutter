import 'package:flutter_test/flutter_test.dart';
import 'package:flutterpolo/Data/models/CarModel.dart'; // Adjust import path if needed

void main() {
  group('CarModel', () {
    test('CarModel can be instantiated with correct properties', () {
      final car = CarModel(
        id: '1',
        name: 'Toyota Camry',
        make: 'Toyota',
        model: 'Camry',
        year: 2020,
        transmissionType: 'Automatic',
        fuelType: 'Petrol',
        passengerCapacity: 5,
        luggageCapacity: '3',
        dailyRate: 25000.0,
        plate: 'ABC123',
        image: 'https://example.com/car.jpg',
      );

      expect(car.id, '1');
      expect(car.name, 'Toyota Camry');
      expect(car.make, 'Toyota');
      expect(car.model, 'Camry');
      expect(car.year, '2020');
      expect(car.transmissionType, 'Automatic');
      expect(car.fuelType, 'Petrol');
      expect(car.passengerCapacity, 5);
      expect(car.luggageCapacity, 3);
      expect(car.dailyRate, 25000.0);
      expect(car.plate, 'ABC123');
      expect(car.image, 'https://example.com/car.jpg');
    });

    test('CarModel.fromJson creates a CarModel with correct properties', () {
      final json = {
        '_id': '1',
        'name': 'Toyota Camry',
        'make': 'Toyota',
        'model': 'Camry',
        'year': '2020',
        'transmissionType': 'Automatic',
        'fuelType': 'Petrol',
        'passengerCapacity': 5,
        'luggageCapacity': 3,
        'dailyRate': 25000.0,
        'plate': 'ABC123',
        'image': 'https://example.com/car.jpg',
      };

      final car = CarModel.fromJson(json);

      expect(car.id, '1');
      expect(car.name, 'Toyota Camry');
      expect(car.make, 'Toyota');
      expect(car.model, 'Camry');
      expect(car.year, '2020');
      expect(car.transmissionType, 'Automatic');
      expect(car.fuelType, 'Petrol');
      expect(car.passengerCapacity, 5);
      expect(car.luggageCapacity, 3);
      expect(car.dailyRate, 25000.0);
      expect(car.plate, 'ABC123');
      expect(car.image, 'https://example.com/car.jpg');
    });

    // Add more unit tests here if needed
  });
}