import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomShettElements extends StatelessWidget {
  final IconData icon;
  final String title;
  final onPress;
  const ButtomShettElements(
      {required this.icon, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            width: Get.width,
            color: Colors.white,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Icon(
                  icon,
                  size: 25,
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey)
      ],
    );
  }
}
