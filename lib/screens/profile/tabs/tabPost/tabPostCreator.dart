import 'package:flutter/material.dart';

class TabPostCreator extends StatelessWidget {
  final Map item;
  const TabPostCreator({required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Image.network(item['image']),
    );
  }
}
