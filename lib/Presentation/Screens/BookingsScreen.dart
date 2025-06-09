import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(onPressed: ()=>{}, icon: Icon(Icons.arrow_back), tooltip: 'Back',),
        actions: <Widget>[
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.account_circle), tooltip: 'Profile')
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        Container(
        color: Colors.grey,
        child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:Column(children:[
          Text("Bookings"),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child:BookingTable())
        ])
        ),
      ),
          ]
        ),
      )
    );
  }
}

class BookingTable extends StatelessWidget {
  const BookingTable({super.key});

  @override
  Widget build(BuildContext context) {
    var bookings=[Booking(
      bookingId: 'B001',
      user: 'Alice Smith',
      car: 'Toyota Camry',
      startDate: '2025-06-10',
      endDate: '2025-06-15',
      pickupLocation: 'Bole Airport',
      pickupTime: '10:00 AM',
      dropoffLocation: 'Piazza',
      dropoffTime: '05:00 PM',
      estimatedPrice: '\$250.00',
      status: 'Confirmed',
    ),
    Booking(
    bookingId: 'B002',
    user: 'Bob Johnson',
    car: 'Honda CRV',
    startDate: '2025-06-12',
    endDate: '2025-06-18',
    pickupLocation: 'Kazanchis',
    pickupTime: '09:00 AM',
    dropoffLocation: 'Meskel Square',
    dropoffTime: '06:00 PM',
    estimatedPrice: '\$300.00',
    status: 'Pending',
    ),
    Booking(
    bookingId: 'B003',
    user: 'Charlie Brown',
    car: 'Hyundai Accent',
    startDate: '2025-06-14',
    endDate: '2025-06-16',
    pickupLocation: 'CMC',
    pickupTime: '11:00 AM',
    dropoffLocation: 'Mexico Square',
    dropoffTime: '04:00 PM',
    estimatedPrice: '\$180.00',
    status: 'Cancelled',
    )
    ];
    return DataTable(
        columns:const <DataColumn>[
          DataColumn(label: Text("BookingId")),
          DataColumn(label: Text("User")),
          DataColumn(label: Text("Car")),
          DataColumn(label: Text("Start-Date")),
          DataColumn(label: Text("End-Date")),
          DataColumn(label: Text("Pickup Location")),
          DataColumn(label: Text("Pickup Time")),
          DataColumn(label: Text("Drop-off Location")),
          DataColumn(label: Text("Drop-off Time")),
          DataColumn(label: Text("Estimated Price")),
          DataColumn(label: Text("Status"))
        ],
      rows: bookings.map((booking){
            return DataRow(cells: <DataCell>[
              DataCell(Text(booking.bookingId)),
              DataCell(Text(booking.user))
            ]);
    }).toList(),
    );
  }
}

class Booking {
  final String bookingId;
  final String user;
  final String car;
  final String startDate;
  final String endDate;
  final String pickupLocation;
  final String pickupTime;
  final String dropoffLocation;
  final String dropoffTime;
  final String estimatedPrice;
  final String status;

  Booking({
    required this.bookingId,
    required this.user,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.pickupLocation,
    required this.pickupTime,
    required this.dropoffLocation,
    required this.dropoffTime,
    required this.estimatedPrice,
    required this.status,
  });
}
