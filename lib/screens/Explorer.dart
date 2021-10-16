import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram/utils/network/allRequests.dart';

class Explorer extends HookWidget {
  const Explorer({Key? key}) : super(key: key);

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          //  padding: EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: 'search',
              // helperText: 'Helper Text',
              // counterText: '0 characters',
              //  border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1, mainAxisSpacing: 1, crossAxisCount: 2),
            itemCount: resultData.value.length,
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(resultData.value[index]["image"],
                      fit: BoxFit.contain),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
