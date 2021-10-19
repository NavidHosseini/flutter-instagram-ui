import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/dashbord/dashbord.dart';
import 'package:instagram/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "instagram",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/dashbord', page: () => Dashbord()),
      ],
    );
  }
}
