import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/home/homeContoroler.dart';
import 'package:instagram/screens/profile/tabs/tabPost/tabPostCreator.dart';

class TabMyPost extends StatelessWidget {
  final TabContoroller = Get.find<HomeContoroller>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: TabContoroller.resultDataProduct.value.length,
          itemBuilder: (BuildContext context, int index) {
            return TabPostCreator(
                item: TabContoroller.resultDataProduct.value[index]);
          }),
    ));
  }
}
