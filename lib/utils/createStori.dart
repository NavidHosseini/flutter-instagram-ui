import 'package:flutter/material.dart';

class CreateStori extends StatelessWidget {
  final Map item;

  const CreateStori({required this.item});

  @override
  Widget build(BuildContext context) {
    // print(item['id']);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(item['image'])),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Text(item['price'].toString())
      ],
    );
  }
}
