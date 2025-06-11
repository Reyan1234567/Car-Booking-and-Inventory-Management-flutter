import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';

class Hompagescreen extends StatefulWidget {
  const Hompagescreen({super.key});

  @override
  State<Hompagescreen> createState() => _HompagescreenState();
}

class _HompagescreenState extends State<Hompagescreen> {
  bool isSameDropOff = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/polo.png', height: 60),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSameDropOff = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSameDropOff ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        "Same drop-off",
                        style: TextStyle(
                          fontWeight: isSameDropOff ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSameDropOff = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: !isSameDropOff ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        "Different drop-off",
                        style: TextStyle(
                          fontWeight: !isSameDropOff ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color(0xFFEA6307),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick-up",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select destination",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color(0xFFEA6307),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Thu, Apr 10",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "09:00 am",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "To",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Fri, Apr 11",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "09:00 am",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEA6307),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Search cars",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
