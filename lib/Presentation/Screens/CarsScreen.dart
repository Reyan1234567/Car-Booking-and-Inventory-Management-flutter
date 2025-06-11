import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/models/CarModel.dart';
import 'package:flutterpolo/Presentation/providers/car/car_provider.dart';
import 'package:flutterpolo/Presentation/widgets/SnackBar.dart';
import 'package:go_router/go_router.dart';

import '../providers/car/car_state.dart';

// Add import for navigation
import 'CarEditScreen.dart';
import 'CarCreateScreen.dart';

class CarsScreen extends ConsumerStatefulWidget {
  const CarsScreen({super.key});

  @override
  ConsumerState<CarsScreen> createState() => _CarsscreenState();
}

class _CarsscreenState extends ConsumerState<CarsScreen> {
  bool isLoading=false;
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(carNotifierProvider.notifier).getccars());
  }

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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/polo.png', width: 40, height: 40),
        ),
        title: Text(
          "Car Inventory",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 32, color: Colors.white),
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
                    ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Carcreatescreen(),
                          ),
                        );
                        if (result != null) {
                          await ref.read(carNotifierProvider.notifier).createCar(result);
                          ref.read(carNotifierProvider.notifier).getccars();
                        }
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text("Add New Car", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEA6307),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search cars...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    // Implement search logic here later
                  },
                ),
                SizedBox(height: 20),
                carState.isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : carState.result == null || carState.result!.isEmpty
                        ? Center(child: Text("No cars found."))
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 25,
                                    dataRowHeight: 60,
                                    headingRowColor: MaterialStateProperty.resolveWith((states) => Color(0xFFF3EFFF)),
                                    columns: const [
                                      DataColumn(label: Text('Plate', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Make', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                    ],
                                    rows: carState.result!.map((car) {
                                      return DataRow(
                                        color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                          if (carState.result!.indexOf(car) % 2 == 0) {
                                            return Color(0xFFF9F7FB);
                                          }
                                          return null;
                                        }),
                                        cells: [
                                          DataCell(Text(car.plate ?? '')),
                                          DataCell(Text(car.name ?? '')),
                                          DataCell(Text(car.make ?? '')),
                                          DataCell(Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Tooltip(
                                                message: 'Edit Car',
                                                child: IconButton(
                                                  icon: Icon(Icons.edit, color: Colors.blueAccent, size: 20),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CarEditScreen(car: car),
                                                      ),
                                                    ).then((_) {
                                                      ref.read(carNotifierProvider.notifier).getccars();
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Tooltip(
                                                message: 'Delete Car',
                                                child: IconButton(
                                                  icon: Icon(Icons.delete, color: Colors.redAccent, size: 20),
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
                                              ),
                                            ],
                                          )),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
