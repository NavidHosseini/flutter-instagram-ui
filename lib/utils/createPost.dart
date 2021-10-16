import 'package:flutter/material.dart';
import 'package:instagram/utils/iconsView.dart';

class CreatePost extends StatelessWidget {
  final Map item;
  const CreatePost({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        shape: BoxShape.circle,
                        image:
                            DecorationImage(image: NetworkImage(item['image'])),
                      ),
                    ),
                  ),
                  Text(item['price'].toString())
                ],
              ),
              Icon(Icons.more_vert)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 300,
              color: Colors.grey,
              child: Image.network(item['image'], fit: BoxFit.fill),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //like comment share
              IconsView(
                icon1: Icons.favorite_outline,
                icon2: Icons.comment_outlined,
                icon3: Icons.send,
                paddingHorizontal: 5.0,
              ),
              //bookmark
              IconsView(
                // icon1: Icons.favorite_outline,
                // icon2: Icons.comment_outlined,
                icon3: Icons.bookmark_outline,
                paddingHorizontal: 5.0,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
