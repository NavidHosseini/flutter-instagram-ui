import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  final icon1;
  final icon2;
  final icon3;
  final double paddingHorizontal;
  const IconsView(
      {this.icon1, this.icon2, this.icon3, required this.paddingHorizontal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon1),
          onPressed: () {
            print('press Like');
          },
          iconSize: 25,
        ),
        IconButton(
          icon: Icon(icon2),
          onPressed: () {
            print('press comment');
          },
          iconSize: 25,
        ),
        IconButton(
          icon: Icon(icon3),
          onPressed: () {
            print('press share');
          },
          iconSize: 25,
        ),
      ],
    );
  }
}
