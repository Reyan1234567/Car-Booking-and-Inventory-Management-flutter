import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/models/CarModel.dart';
import 'package:flutterpolo/Presentation/providers/car/car_provider.dart';
import 'package:flutterpolo/Presentation/widgets/DropDown.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';
import 'package:flutterpolo/Presentation/widgets/ToggleUpOrDown.dart';

class CarEditScreen extends ConsumerStatefulWidget {
  final CarModel car;
  const CarEditScreen({super.key, required this.car});

  @override
  ConsumerState<CarEditScreen> createState() => _CarEditScreenState();
}

class _CarEditScreenState extends ConsumerState<CarEditScreen> {
  late TextEditingController plateController;
  late TextEditingController nameController;
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController yearController;
  late TextEditingController dailyRateController;
  late TextEditingController transmissionTypeController;
  late TextEditingController fuelTypeController;
  late TextEditingController passengerCapacityController;
  late TextEditingController luggageCapacityController;
  late TextEditingController imageController;

  List<String> transmissionTypes = ["Automatic", "Manual"];
  String selectedTransmission = "Automatic";
  List<String> fuelTypes = ["Benzene", "Petrol"];
  String selectedFuel = "Benzene";

  @override
  void initState() {
    super.initState();
    plateController = TextEditingController(text: widget.car.plate ?? '');
    nameController = TextEditingController(text: widget.car.name ?? '');
    makeController = TextEditingController(text: widget.car.make ?? '');
    modelController = TextEditingController(text: widget.car.model ?? '');
    yearController = TextEditingController(text: widget.car.year.toString());
    dailyRateController = TextEditingController(text: widget.car.dailyRate.toString());
    transmissionTypeController = TextEditingController(text: widget.car.transmissionType ?? '');
    fuelTypeController = TextEditingController(text: widget.car.fuelType ?? '');
    passengerCapacityController = TextEditingController(text: widget.car.passengerCapacity.toString());
    luggageCapacityController = TextEditingController(text: widget.car.luggageCapacity ?? '');
    imageController = TextEditingController(text: widget.car.image ?? '');

    selectedTransmission = widget.car.transmissionType ?? "Automatic";
    selectedFuel = widget.car.fuelType ?? "Benzene";
  }

  void _submitForm() {
    if (plateController.text.isEmpty ||
        nameController.text.isEmpty ||
        makeController.text.isEmpty ||
        modelController.text.isEmpty ||
        yearController.text.isEmpty ||
        dailyRateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    final carData = {
      'plate': plateController.text,
      'name': nameController.text,
      'make': makeController.text,
      'model': modelController.text,
      'year': int.tryParse(yearController.text) ?? 0,
      'transmissionType': selectedTransmission,
      'fuelType': selectedFuel,
      'passengerCapacity': int.tryParse(passengerCapacityController.text) ?? 0,
      'luggageCapacity': luggageCapacityController.text,
      'dailyRate': double.tryParse(dailyRateController.text) ?? 0.0,
      'image': imageController.text,
    };

    ref.read(carNotifierProvider.notifier).editCar(widget.car.id, carData);
    Navigator.pop(context);
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
            customTextField(dailyRateController, TextInputType.number, 'Daily Rate', false, ''),
            SizedBox(height: 10),
            customTextField(luggageCapacityController, TextInputType.text, 'Luggage Capacity', false, ''),
            SizedBox(height: 10),
            customTextField(imageController, TextInputType.text, 'Image URL', false, ''),
            SizedBox(height: 20),
            customDropDown(transmissionTypes, (newValue) {
              setState(() {
                selectedTransmission = newValue;
              });
            }, selectedTransmission),
            SizedBox(height: 10),
            customDropDown(fuelTypes, (newValue) {
              setState(() {
                selectedFuel = newValue;
              });
            }, selectedFuel),
            SizedBox(height: 20),
            NumberStepper(passengerCapacityController, () {
              int temp = int.parse(passengerCapacityController.text) + 1;
              passengerCapacityController.text = temp.toString();
            }, () {
              int temp = int.parse(passengerCapacityController.text) - 1;
              if (temp <= 0) {
                passengerCapacityController.text = "0";
              } else {
                passengerCapacityController.text = temp.toString();
              }
            }),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEA6307),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Save Changes", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    plateController.dispose();
    nameController.dispose();
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    dailyRateController.dispose();
    transmissionTypeController.dispose();
    fuelTypeController.dispose();
    passengerCapacityController.dispose();
    luggageCapacityController.dispose();
    imageController.dispose();
    super.dispose();
  }
}

