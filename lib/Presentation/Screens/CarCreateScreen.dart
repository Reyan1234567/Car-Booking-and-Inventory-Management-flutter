import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/Car.dart';
import 'package:flutterpolo/Presentation/providers/car/car_provider.dart';
import 'package:flutterpolo/Presentation/widgets/DropDown.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';
import 'package:flutterpolo/Presentation/widgets/ToggleUpOrDown.dart';

class Carcreatescreen extends ConsumerStatefulWidget {
  const Carcreatescreen({super.key});

  @override
  ConsumerState<Carcreatescreen> createState() => _CarcreatescreenState();
}

class _CarcreatescreenState extends ConsumerState<Carcreatescreen> {
  final plateController=TextEditingController();
  final nameController=TextEditingController();
  final makeController=TextEditingController();
  final priceController=TextEditingController();
  final newPriceController=TextEditingController();
  final modelController=TextEditingController();
  final yearController=TextEditingController();
  final vehicleTypeController=TextEditingController();
  final transmissionTypeController=TextEditingController();
  final fuelTypeController=TextEditingController();
  final passengerCapacityController=TextEditingController(text: "0");
  final luggageCapacityController=TextEditingController();
  final imageController=TextEditingController();

  List<String> transmissionTypes=["Automatic", "Manual"];
  String selectedTransmission="Automatic";
  List<String> fuelTypes=["Benzene", "Petrol"];
  String selectedFuel="Benzene";

  void _submitForm() {
    if (plateController.text.isEmpty ||
        nameController.text.isEmpty ||
        makeController.text.isEmpty ||
        modelController.text.isEmpty ||
        yearController.text.isEmpty ||
        priceController.text.isEmpty ||
        newPriceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    final carData = CarCreateRequest(
      double.tryParse(priceController.text) ?? 0.0,
      selectedFuel,
      imageController.text,
      luggageCapacityController.text,
      makeController.text,
      modelController.text,
      nameController.text,
      int.tryParse(passengerCapacityController.text) ?? 0,
      plateController.text,
      int.tryParse(newPriceController.text) ?? 0,
      selectedTransmission,
      int.tryParse(yearController.text) ?? 0,
    );

    // Use the car provider to create the car
    ref.read(carNotifierProvider.notifier).createCar(carData).then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating car: ${error.toString()}')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the car state for loading and error states
    ref.listen(carNotifierProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    final carState = ref.watch(carNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEA6307), Color(0xFFF09849)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white)
        ),
        title: Text("Add New Car", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basic Information",
                  style: TextStyle(
                    color: Color(0xFF7B4BBA),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        customTextField(plateController, TextInputType.text, "Plate", false, "88888"),
                        SizedBox(height: 10),
                        customTextField(nameController, TextInputType.text, "Name", false, "Camry"),
                        SizedBox(height: 10),
                        customTextField(makeController, TextInputType.text, "Make", false, "Toyota"),
                        SizedBox(height: 10),
                        customTextField(modelController, TextInputType.text, "Model", false, "Camry"),
                        SizedBox(height: 10),
                        customTextField(yearController, TextInputType.number, "Year", false, "2024"),
                        SizedBox(height: 10),
                        customTextField(priceController, TextInputType.number, "Daily Rate", false, "200"),
                        SizedBox(height: 10),
                        customTextField(newPriceController, TextInputType.number, "Price", false, "25000"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Additional Details",
                  style: TextStyle(
                    color: Color(0xFF7B4BBA),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        customTextField(luggageCapacityController, TextInputType.text, "Luggage Capacity", false, "2 Large Bags"),
                        SizedBox(height: 10),
                        customTextField(imageController, TextInputType.text, "Image URL", false, ""),
                        SizedBox(height: 10),
                        customDropDown(transmissionTypes, (newValue){
                          setState(() {
                            selectedTransmission=newValue;
                          });
                        }, selectedTransmission),
                        SizedBox(height: 10),
                        customDropDown(fuelTypes, (newValue){
                          setState(() {
                            selectedFuel=newValue;
                          });
                        }, selectedFuel),
                        SizedBox(height: 10),
                        NumberStepper(
                          passengerCapacityController,
                          () {
                            setState(() {
                              int temp = int.parse(passengerCapacityController.text) - 1;
                              if (temp <= 0) {
                                passengerCapacityController.text = "0";
                              } else {
                                passengerCapacityController.text = temp.toString();
                              }
                            });
                          },
                          () {
                            setState(() {
                              int temp = int.parse(passengerCapacityController.text) + 1;
                              passengerCapacityController.text = temp.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: carState.isLoading == true ? null : _submitForm,
                    icon: Icon(Icons.add_circle_outline, color: Colors.white),
                    label: Text(
                      carState.isLoading == true ? "Creating..." : "Create Car",
                      style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEA6307),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (carState.isLoading == true)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA6307)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    plateController.dispose();
    nameController.dispose();
    makeController.dispose();
    priceController.dispose();
    newPriceController.dispose();
    modelController.dispose();
    yearController.dispose();
    vehicleTypeController.dispose();
    transmissionTypeController.dispose();
    fuelTypeController.dispose();
    passengerCapacityController.dispose();
    luggageCapacityController.dispose();
    imageController.dispose();
    super.dispose();
  }
}
