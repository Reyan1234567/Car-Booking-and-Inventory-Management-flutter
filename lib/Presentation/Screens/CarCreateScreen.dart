import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/DropDown.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';
import 'package:flutterpolo/Presentation/widgets/ToggleUpOrDown.dart';

class Carcreatescreen extends StatefulWidget {
  const Carcreatescreen({super.key});

  @override
  State<Carcreatescreen> createState() => _CarcreatescreenState();
}

class _CarcreatescreenState extends State<Carcreatescreen> {
  final plateController=TextEditingController();
  final nameController=TextEditingController();
  final makeController=TextEditingController();
  final priceController=TextEditingController();
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
        priceController.text.isEmpty) {
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
      'dailyRate': double.tryParse(priceController.text) ?? 0.0,
      'image': imageController.text,
    };

    Navigator.pop(context, carData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back)
        ),
        title: Text("Add New Car"),
      ),
      body: SingleChildScrollView(
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
            customTextField(luggageCapacityController, TextInputType.text, "Luggage Capacity", false, "2 Large Bags"),
            SizedBox(height: 10),
            customTextField(imageController, TextInputType.text, "Image URL", false, ""),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            NumberStepper(passengerCapacityController, (){
              int temp=int.parse(passengerCapacityController.text)+1;
              passengerCapacityController.text=temp.toString();
            }, (){
              int temp=int.parse(passengerCapacityController.text)-1;
              if(temp<=0){
                passengerCapacityController.text="0";
              }
              else{
                passengerCapacityController.text=temp.toString();
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
              child: Text("Create Car", style: TextStyle(color: Colors.white, fontSize: 16)),
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
    priceController.dispose();
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
