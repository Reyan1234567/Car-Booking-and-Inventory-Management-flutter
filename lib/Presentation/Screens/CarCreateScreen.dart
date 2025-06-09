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

  List<String> transmissionTypes=["Automatic", "Manual"];
  String selectedTransmission="Automatic";
  List<String> fuelTypes=["Benzene", "Petrol"];
  String selectedFuel="Benzene";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        title: Text("Add New Car"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(plateController, TextInputType.text, "Plate", false, "88888"),
            customTextField(nameController, TextInputType.text, "Name", false, "Camry"),
            customTextField(priceController, TextInputType.text, "Price", false, "200"),
            customTextField(modelController, TextInputType.text, "Model", false, "Eg-xu"),
            customTextField(yearController, TextInputType.text, "Year", false, "2004"),
            customTextField(vehicleTypeController, TextInputType.text, "Vehicle-Type", false, "Commercial"),

            customDropDown(transmissionTypes, (newValue){
              setState(() {
            selectedTransmission=newValue;
              });
            }, selectedTransmission),
            customDropDown(fuelTypes, (newValue){setState(() {
              selectedFuel=newValue;
            });}, selectedFuel),


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

            NumberStepper(luggageCapacityController, (){
              int temp=int.parse(luggageCapacityController.text)+1;
              luggageCapacityController.text=temp.toString();
            }, (){
              int temp=int.parse(luggageCapacityController.text)-1;
              if(temp<=0){
                luggageCapacityController.text="0";
              }
              else{
                luggageCapacityController.text=temp.toString();
              }
            }),
            TextButton(onPressed: (){}, child: Text("Create Care"))
          ],
        ),
      ),
    );
  }
}
