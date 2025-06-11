import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEA6307),
        title: Row(
          children: [
            Image.asset(
              'assets/images/polo.png', // Assuming you have a logo in assets folder
              height: 40,
            ),
            const SizedBox(width: 8),
            const Text(
              'POLO CAR RENTALS',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildDashboardCard(
                    title: 'Total Booking',
                    value: '80',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardCard(
                    title: 'Total Cars',
                    value: '180',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDashboardCard(
                    title: 'Total Accounts',
                    value: '1030',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardCard(
                    title: 'Active users',
                    value: '532',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildRevenueChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({required String title, required String value}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueChart() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Revenue Chart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Placeholder for the chart
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomPaint(
                painter: LineChartPainter(),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw horizontal grid lines
    for (int i = 0; i <= 10; i++) {
      final y = size.height / 10 * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw vertical grid lines
    for (int i = 0; i <= 10; i++) {
      final x = size.width / 10 * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Example data points for two lines
    final List<Offset> points1 = [
      Offset(size.width * 0.05, size.height * 0.8),
      Offset(size.width * 0.25, size.height * 0.4),
      Offset(size.width * 0.45, size.height * 0.6),
      Offset(size.width * 0.65, size.height * 0.3),
      Offset(size.width * 0.85, size.height * 0.7),
      Offset(size.width * 0.95, size.height * 0.2),
    ];

    final List<Offset> points2 = [
      Offset(size.width * 0.05, size.height * 0.2),
      Offset(size.width * 0.25, size.height * 0.7),
      Offset(size.width * 0.45, size.height * 0.3),
      Offset(size.width * 0.65, size.height * 0.8),
      Offset(size.width * 0.85, size.height * 0.4),
      Offset(size.width * 0.95, size.height * 0.9),
    ];

    final path1 = Path();
    path1.moveTo(points1[0].dx, points1[0].dy);
    for (int i = 1; i < points1.length; i++) {
      path1.lineTo(points1[i].dx, points1[i].dy);
    }
    canvas.drawPath(path1, linePaint);

    final path2 = Path();
    path2.moveTo(points2[0].dx, points2[0].dy);
    for (int i = 1; i < points2.length; i++) {
      path2.lineTo(points2[i].dx, points2[i].dy);
    }
    canvas.drawPath(path2, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


