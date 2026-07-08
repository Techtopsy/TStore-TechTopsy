import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// --- Load Category Data
  Future<void> fetchCategories() async {
    try {
      // Show Loader While Loading Categories
      isLoading.value = true;

      // Fetch Categories from Source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the Category List.
      allCategories.assignAll(categories);

      // Filter Featured Categories.
      featuredCategories.assignAll(categories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap !!!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// --- Load Selected Category Data

  /// Get Category or Sub-Category Products
}
