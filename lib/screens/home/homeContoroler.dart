import 'dart:convert';

import 'package:get/get.dart';
import 'package:instagram/utils/network/allRequests.dart';

class HomeContoroller extends GetxController {
  var resultDataUser = [].obs;
  var resultDataProduct = [].obs;

  void onInit() {
    getUserApi();
    getProductApi();
    super.onInit();
  }

  getUserApi() async {
    final getData = await getHttp("https://reqres.in/api/users");
    var decodedResponse = jsonDecode(getData.body);
    resultDataUser.value = decodedResponse['data'];
    // update();
  }

  getProductApi() async {
    final getData = await getHttp("https://fakestoreapi.com/products");
    var decodedResponse = jsonDecode(getData.body);
    resultDataProduct.value = decodedResponse;
    // update();
  }
}
