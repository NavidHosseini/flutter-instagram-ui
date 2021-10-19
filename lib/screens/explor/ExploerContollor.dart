import 'dart:convert';

import 'package:get/get.dart';
import 'package:instagram/utils/network/allRequests.dart';

class ExplorerController extends GetxController {
  var resultData = [].obs;

  void onInit() {
    getFromApi();
    super.onInit();
  }

  getFromApi() async {
    final getData = await getHttp("https://fakestoreapi.com/products");
    var decodedResponse = jsonDecode(getData.body);
    resultData.value = decodedResponse;
    print('request');
    // update();
  }
}
