import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:instagram/components/home/CreatePostController.dart';
import 'package:instagram/components/iconsView.dart';

class CreatePost extends StatelessWidget {
  final Map item;
  final Map itemPruduct;

  const CreatePost({
    required this.item,
    required this.itemPruduct,
  });

  @override
  Widget build(BuildContext context) {
    var isLike = false.obs;
    var isBookmark = false.obs;
    changeIsLike() {
      isLike.value = !isLike.value;
    }

    changeIsBookmark() {
      isBookmark.value = !isBookmark.value;
    }

    bottomSheet() {
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

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('user Tab${item['id']}');
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${item["avatar"]}"),
                      radius: 30,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  Text(
                    "${item["first_name"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              IconButton(icon: Icon(Icons.more_vert), onPressed: bottomSheet)
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          GestureDetector(
            onDoubleTap: changeIsLike,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              //   color: Colors.amber,
              child: Image.network(
                "${itemPruduct["image"]}",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          IconsView(
            isLike: isLike,
            isBookmark: isBookmark,
            changeIsLike: changeIsLike,
            changeIsBookmark: changeIsBookmark,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10),
              child: Text('127 likes',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text("${item["first_name"]}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Text("${item["last_name"]}",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
