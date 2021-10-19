import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:instagram/components/home/createStori.dart';
import 'package:instagram/components/profile/ListofSuggestion.dart';
import 'package:instagram/components/profile/buttomSheetElement.dart';
import 'package:instagram/screens/editProfile/editProfile.dart';
import 'package:instagram/screens/home/homeContoroler.dart';

class Profile extends StatelessWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeContoroller = Get.find<HomeContoroller>();
    final profileContoroller = Get.put(ProfileContoroller());

    bottomSheetAddPost() {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtomShettElements(
                      icon: Icons.grid_on_outlined,
                      title: "Post",
                      onPress: () {
                        print('post');
                      }),
                  ButtomShettElements(
                      icon: Icons.toll,
                      title: "Story",
                      onPress: () {
                        print('2');
                      }),
                  ButtomShettElements(
                      icon: Icons.touch_app_sharp,
                      title: "Story Highlight",
                      onPress: () {
                        print('3');
                      }),
                  ButtomShettElements(
                      icon: Icons.live_tv_outlined,
                      title: "Igtv Video",
                      onPress: () {
                        print('3');
                      }),
                  ButtomShettElements(
                      icon: Icons.wifi_tethering_rounded,
                      title: "Live",
                      onPress: () {
                        print('3');
                      }),
                  ButtomShettElements(
                      icon: Icons.auto_stories_outlined,
                      title: "Guide",
                      onPress: () {
                        print('3');
                      }),
                ],
              ),
            );
          });
    }

    Widget showSuggestion() {
      return profileContoroller.isShowSuggestion.value
          ? ListOfSuggestion()
          : Divider(
              color: Colors.white,
            );
    }

    bottomSheetMenu() {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.link),
                              onPressed: () {
                                print('link');
                              },
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                            ),
                            height: 50,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                          Text('link')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.share_outlined),
                              onPressed: () {
                                print('share');
                              },
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                            ),
                            height: 50,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                          Text('share')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.report_outlined),
                              onPressed: () {
                                print('report');
                              },
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                            ),
                            height: 50,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                          Text('report')
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      GestureDetector(
                          child: Container(
                              padding:
                                  EdgeInsets.only(bottom: 3, left: 10, top: 3),
                              width: 80,
                              height: 40,
                              //color: Colors.red,
                              child: Text('Hide', textAlign: TextAlign.start))),
                      GestureDetector(
                          child: Container(
                              padding:
                                  EdgeInsets.only(bottom: 3, left: 10, top: 3),
                              width: 80,
                              height: 40,
                              //color: Colors.red,
                              child: Text('Unfollow',
                                  textAlign: TextAlign.start))),
                    ],
                  ),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  color: Colors.black87,
                ),
                Text("navid.hosseini73",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87)),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black87,
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: Colors.black87,
                  ),
                  color: Colors.black87,
                  onPressed: bottomSheetAddPost,
                  // size: 28,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                IconButton(
                    onPressed: bottomSheetAddPost,
                    icon: Icon(
                      Icons.menu,
                      size: 28,
                      color: Colors.black87,
                    ))
              ],
            )
          ],
        ),
      ),
      body: Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    avatarContainer(
                        homeContoroller.resultDataUser.value[4]['avatar'],
                        100.0),
                    followAndOtherView(40, "post"),
                    followAndOtherView(186, "followers"),
                    followAndOtherView(203, "following"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "Navid hosseini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution"),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.73,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: TextButton(
                          onPressed: () {
                            Get.to(EditProfile(userData: {
                              "imageUrl": homeContoroller
                                  .resultDataUser.value[4]['avatar'],
                              "name": "Navid Hosseini",
                              "bio":
                                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution",
                            }));
                          },
                          child: Text(
                            'edit profile',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: TextButton(
                          onPressed: profileContoroller.toggleShowSuggestion,
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              showSuggestion(),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeContoroller.resultDataUser.value.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CreateStori(
                                item: homeContoroller
                                    .resultDataUser.value[index])),
                  )),
            ],
          );
        }),
      ),
    );
  }

  followAndOtherView(int number, String title) {
    return Container(
      child: Column(
        children: [
          Text(
            "${number}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            "${title}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  avatarContainer(src, double number) {
    return Container(
      width: number,
      height: number,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(src),
        ),
      ),
    );
  }
}

class ProfileContoroller extends GetxController {
  var isShowSuggestion = false.obs;

  toggleShowSuggestion() {
    isShowSuggestion.value = !isShowSuggestion.value;
  }
}
