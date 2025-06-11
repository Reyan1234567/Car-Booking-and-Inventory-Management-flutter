import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NumberStepper(
  TextEditingController controller,
  void Function() decrease,
  void Function() increase,
) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Color(0xFFC3C3C3), width: 1.0),
    ),
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Passenger Capacity',
                  style: TextStyle(
                    color: Color(0xFF9D9D9D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: controller,
                  readOnly: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xFFC3C3C3)),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Color(0xFFC3C3C3)),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    int currentValue = int.tryParse(controller.text) ?? 0;
                    if (currentValue > 0) {
                      controller.text = (currentValue - 1).toString();
                      decrease();
                    }
                  },
                  icon: Icon(Icons.remove, color: Color(0xFF7B4BBA)),
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    int currentValue = int.tryParse(controller.text) ?? 0;
                    controller.text = (currentValue + 1).toString();
                    increase();
                  },
                  icon: Icon(Icons.add, color: Color(0xFF7B4BBA)),
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}