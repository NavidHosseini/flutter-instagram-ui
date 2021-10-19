import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('splash'),
      ),
      body: GestureDetector(
        child: Center(child: Text('go')),
        onTap: () {
          Get.offAndToNamed("/dashbord");
          print("object");
        },
      ),
    );
  }
}
