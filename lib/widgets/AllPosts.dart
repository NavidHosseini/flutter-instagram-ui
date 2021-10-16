import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram/utils/createPost.dart';
import 'package:instagram/utils/network/allRequests.dart';
import 'package:instagram/widgets/Stories.dart';

class AllPosts extends HookWidget {
  const AllPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultData = useState([]);

    getFromApi() async {
      final getData = await getHttp("https://fakestoreapi.com/products");
      var decodedResponse = jsonDecode(getData.body);
      resultData.value = decodedResponse;
    }

    useEffect(() {
      getFromApi();
    }, []);

    return Expanded(
      flex: 1,
      child: Container(
          //height: 800,
          child: ListView.builder(
              itemCount: resultData.value.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext ctnx, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Stories(),
                      CreatePost(item: resultData.value[index])
                    ],
                  );
                } else {
                  return CreatePost(item: resultData.value[index]);
                }
              })),
    );
  }
}
