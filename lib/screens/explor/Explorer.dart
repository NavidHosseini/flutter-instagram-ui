import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/explor/ExploerContollor.dart';

class Explorer extends StatelessWidget {
  final explorerController = Get.put(ExplorerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: 'search',
              // helperText: 'Helper Text',
              // counterText: '0 characters',
              //  border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: GestureDetector(onTap: () {}, child: Text('asd')),
    );
  }
}
