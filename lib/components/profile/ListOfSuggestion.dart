import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/components/home/createStori.dart';
import 'package:instagram/screens/home/homeContoroler.dart';

class ListOfSuggestion extends StatelessWidget {
  // const ListOfSuggestion({Key? key}) : super(key: key);
  final homeContoroller = Get.find<HomeContoroller>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 140,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: homeContoroller.resultDataUser.value.length,
              itemBuilder: (BuildContext context, int index) => CreateStori(
                  item: homeContoroller.resultDataUser.value[index])),
        ));
  }
}
