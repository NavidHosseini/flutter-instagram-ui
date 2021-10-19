import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/components/home/CreatePostController.dart';

class IconsView extends StatelessWidget {
  final isLike;
  final isBookmark;
  final changeIsLike;
  final changeIsBookmark;

  const IconsView({
    this.isLike,
    this.isBookmark,
    this.changeIsLike,
    this.changeIsBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: changeIsLike,
                icon: isLike.value
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_outline),
                color: isLike.value ? Colors.red : Colors.black,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.comment_outlined)), //comment
              IconButton(onPressed: () {}, icon: Icon(Icons.send)), //share
            ],
          ),
          IconButton(
              onPressed: changeIsBookmark,
              icon: Icon(isBookmark.value
                  ? Icons.bookmark
                  : Icons.bookmark_add_outlined)), //bookmark
        ],
      );
    });
  }
}
