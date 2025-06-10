import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/models/CarModel.dart';
import 'package:flutterpolo/Presentation/providers/car/car_provider.dart';
import 'package:flutterpolo/Presentation/widgets/SnackBar.dart';

import '../providers/car/car_state.dart';

// Add import for navigation
import 'CarEditScreen.dart';

class CarsScreen extends ConsumerStatefulWidget {
  const CarsScreen({super.key});

  @override
  ConsumerState<CarsScreen> createState() => _CarsscreenState();
}

class _CarsscreenState extends ConsumerState<CarsScreen> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    ref.listen(carNotifierProvider, (previous, next){
      if(next.error!=null){
        customSnackBar(context, "${next.error}", Color(0xFFFF0000));
      }
      if(next.error==null && next.result!=null && next.result is List<CarModel>){
        final cars=next.result;
      }
      if(next.error==null && next.isLoading!=previous?.isLoading){
        setState(() {
          isLoading=next.isLoading??false;
        });
      }
    });

    final carState = ref.watch(carNotifierProvider);

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFFEA6307),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/polo.png', width: 40, height: 40),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 32),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xFFF6F1F8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0xFFF3EFFF),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Car Inventory",
                      style: TextStyle(
                        color: Color(0xFF7B4BBA),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEA6307),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: Text("Add New Car", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: carState.isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : carState.result == null || carState.result!.isEmpty
                          ? Center(child: Text("No cars found."))
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Plate', style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text('Make', style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                                ],
                                rows: carState.result!.map((car) {
                                  return DataRow(cells: [
                                    DataCell(Text(car.plate ?? '')),
                                    DataCell(Text(car.name ?? '')),
                                    DataCell(Text(car.make ?? '')),
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () async {
                                            // Navigate to edit screen
                                            final updatedCar = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CarEditScreen(car: car),
                                              ),
                                            );
                                            if (updatedCar != null) {
                                              ref.read(carNotifierProvider.notifier).editCar(car.id, updatedCar);
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () async {
                                            final confirm = await showDialog<bool>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text('Delete Car'),
                                                content: Text('Are you sure you want to delete this car?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, true),
                                                    child: Text('Delete', style: TextStyle(color: Colors.red)),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (confirm == true) {
                                              ref.read(carNotifierProvider.notifier).deleteCar(car.id);
                                            }
                                          },
                                        ),
                                      ],
                                    )),
                                  ]);
                                }).toList(),
                              ),
                        ),
                        )
                        ])
                        )
                        )
                        ));
  }
}
