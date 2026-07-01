import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselControllerIndex = 0.obs;

  void updatePageIndicator(dynamic index) {
    carouselControllerIndex.value = index;
  }
}
