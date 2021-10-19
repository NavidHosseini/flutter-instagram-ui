import 'dart:convert';

import 'package:get/get.dart';
import 'package:instagram/utils/network/allRequests.dart';

class CreatePostController extends GetxController {
  var isLike = false.obs;
  var isBookmark = false.obs;

  // void onInit() {
  //   getUserApi();
  //   getProductApi();
  //   super.onInit();
  // }

  changeIsLike() {
    isLike.value = !isLike.value;
  }

  changeIsBookmark() {
    isBookmark.value = !isBookmark.value;
  }
}
