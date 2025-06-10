import 'package:flutter/material.dart';
import 'package:flutterpolo/Data/models/CarModel.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';

class CarEditScreen extends StatefulWidget {
  final CarModel car;
  const CarEditScreen({super.key, required this.car});

  @override
  State<CarEditScreen> createState() => _CarEditScreenState();
}

class _CarEditScreenState extends State<CarEditScreen> {
  late TextEditingController plateController;
  late TextEditingController nameController;
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController yearController;
  late TextEditingController priceController;
  late TextEditingController categoryController;
  late TextEditingController transmissionTypeController;
  late TextEditingController fuelTypeController;
  late TextEditingController passengerCapacityController;
  late TextEditingController luggageCapacityController;
  late TextEditingController imageUrlController;
  late TextEditingController dailyRateController;
  late TextEditingController hourlyRateController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    plateController = TextEditingController(text: widget.car.plate ?? '');
    nameController = TextEditingController(text: widget.car.name ?? '');
    makeController = TextEditingController(text: widget.car.make ?? '');
    modelController = TextEditingController(text: widget.car.model ?? '');
    yearController = TextEditingController(text: widget.car.year.toString());
    priceController = TextEditingController(text: widget.car.price.toString());
    categoryController = TextEditingController(text: widget.car.category ?? '');
    transmissionTypeController = TextEditingController(text: widget.car.transmissionType ?? '');
    fuelTypeController = TextEditingController(text: widget.car.fuelType ?? '');
    passengerCapacityController = TextEditingController(text: widget.car.passengerCapacity.toString());
    luggageCapacityController = TextEditingController(text: widget.car.luggageCapacity ?? '');
    imageUrlController = TextEditingController(text: widget.car.imageUrl ?? '');
    dailyRateController = TextEditingController(text: widget.car.dailyRate.toString());
    hourlyRateController = TextEditingController(text: widget.car.hourlyRate.toString());
    imageController = TextEditingController(text: widget.car.image ?? '');
  }

  @override
  void dispose() {
    plateController.dispose();
    nameController.dispose();
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    priceController.dispose();
    categoryController.dispose();
    transmissionTypeController.dispose();
    fuelTypeController.dispose();
    passengerCapacityController.dispose();
    luggageCapacityController.dispose();
    imageUrlController.dispose();
    dailyRateController.dispose();
    hourlyRateController.dispose();
    imageController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedCar = {
      'plate': plateController.text,
      'name': nameController.text,
      'make': makeController.text,
      'model': modelController.text,
      'year': int.tryParse(yearController.text) ?? 0,
      'price': double.tryParse(priceController.text) ?? 0.0,
      'category': categoryController.text,
      'transmissionType': transmissionTypeController.text,
      'fuelType': fuelTypeController.text,
      'passengerCapacity': int.tryParse(passengerCapacityController.text) ?? 0,
      'luggageCapacity': luggageCapacityController.text,
      'imageUrl': imageUrlController.text,
      'dailyRate': double.tryParse(dailyRateController.text) ?? 0.0,
      'hourlyRate': double.tryParse(hourlyRateController.text) ?? 0.0,
      'image': imageController.text,
    };
    Navigator.pop(context, updatedCar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            customTextField(plateController, TextInputType.text, 'Plate', false, ''),
            SizedBox(height: 10),
            customTextField(nameController, TextInputType.text, 'Name', false, ''),
            SizedBox(height: 10),
            customTextField(makeController, TextInputType.text, 'Make', false, ''),
            SizedBox(height: 10),
            customTextField(modelController, TextInputType.text, 'Model', false, ''),
            SizedBox(height: 10),
            customTextField(yearController, TextInputType.number, 'Year', false, ''),
            SizedBox(height: 10),
            customTextField(priceController, TextInputType.number, 'Price', false, ''),
            SizedBox(height: 10),
            customTextField(categoryController, TextInputType.text, 'Category', false, ''),
            SizedBox(height: 10),
            customTextField(transmissionTypeController, TextInputType.text, 'Transmission Type', false, ''),
            SizedBox(height: 10),
            customTextField(fuelTypeController, TextInputType.text, 'Fuel Type', false, ''),
            SizedBox(height: 10),
            customTextField(passengerCapacityController, TextInputType.number, 'Passenger Capacity', false, ''),
            SizedBox(height: 10),
            customTextField(luggageCapacityController, TextInputType.text, 'Luggage Capacity', false, ''),
            SizedBox(height: 10),
            customTextField(imageUrlController, TextInputType.text, 'Image URL', false, ''),
            SizedBox(height: 10),
            customTextField(dailyRateController, TextInputType.number, 'Daily Rate', false, ''),
            SizedBox(height: 10),
            customTextField(hourlyRateController, TextInputType.number, 'Hourly Rate', false, ''),
            SizedBox(height: 10),
            customTextField(imageController, TextInputType.text, 'Image', false, ''),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEA6307),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text('Save Changes', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
