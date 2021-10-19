import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/components/home/CreatePostController.dart';
import 'package:instagram/components/home/createPost.dart';
import 'package:instagram/components/home/createStori.dart';
import 'package:instagram/screens/home/homeContoroler.dart';

class Home extends StatelessWidget {
  final homeContoroller = Get.put(HomeContoroller());
  final iconContoroler = Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                width: 150,
                height: 50,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  image: new AssetImage("assets/images/instaTitle.png"),
                  fit: BoxFit.cover,
                ))
                // child: Text('instagram'),
                ),
            Row(
              children: [
                Icon(
                  Icons.send,
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 140,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeContoroller.resultDataUser.value.length,
                  itemBuilder: (BuildContext context, int index) => CreateStori(
                      item: homeContoroller.resultDataUser.value[index])),
            ),
            ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeContoroller.resultDataUser.value.length,
                itemBuilder: (context, int index) {
                  return CreatePost(
                    item: homeContoroller.resultDataUser.value[index],
                    itemPruduct: homeContoroller.resultDataProduct.value[index],
                    // iconContoroler: iconContoroler,
                  );
                })
          ],
        ),
      ),
    );
  }
}
//  RaisedButton(
//           onPressed: () {
//             print(homeContoroller.resultDataUser.value[0]);
//           },
//           child: Text('sd'),
//         );