import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram/utils/createStori.dart';
import 'package:instagram/utils/network/allRequests.dart';

class Stories extends HookWidget {
  const Stories({Key? key}) : super(key: key);

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

    //print(resultData.value);
    return Container(
        height: 130,
        child: ListView.builder(
            itemCount: resultData.value.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctnx, int index) {
              return CreateStori(item: resultData.value[index]);
            }));
  }
}
