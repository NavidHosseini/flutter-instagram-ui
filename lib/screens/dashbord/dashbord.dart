import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/Add.dart';
import 'package:instagram/screens/explor/Explorer.dart';
import 'package:instagram/screens/home/Home.dart';
import 'package:instagram/screens/NotificationReciver.dart';
import 'package:instagram/screens/dashbord/dashbordState.dart';
import 'package:instagram/screens/profile/profileView.dart';

class Dashbord extends StatelessWidget {
  final dashbordState = Get.put(DashbordState());

  final List pageList = [
    Home(),
    Explorer(),
    Add(),
    NotificationReciver(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: pageList[dashbordState.indexPage.value],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                dashbordState.changeIndex(index);
              },
              currentIndex: dashbordState.indexPage.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search_outlined,
                      size: 30,
                    ),
                    label: "search"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_outlined,
                      size: 30,
                    ),
                    label: "add"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_outline_sharp,
                      size: 30,
                    ),
                    label: "favorate"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                    ),
                    label: "profile"),
              ]));
    });
  }
}
