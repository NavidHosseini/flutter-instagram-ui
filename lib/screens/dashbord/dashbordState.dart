import 'package:get/get.dart';

class DashbordState extends GetxController {
  var indexPage = 0.obs;

  changeIndex(int index) {
    return indexPage.value = index;
  }
}
