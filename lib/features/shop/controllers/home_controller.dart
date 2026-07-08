import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/dummy_data.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselControllerIndex = 0.obs;
  final List<BannerModel> banners = TDummyData.banners;

  void updatePageIndicator(int index) {
    carouselControllerIndex.value = index;
  }
}
