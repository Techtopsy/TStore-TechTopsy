import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;

      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;

      case 'Newest':
        products.sort((a, b) {
          if (a.date == null && b.date == null) return 0;
          if (a.date == null) return 1; // Null dates go last
          if (b.date == null) return -1;
          return b.date!.compareTo(a.date!); // Newest first
        });
        break;

      case 'Sale':
        products.sort((a, b) {
          final aSale = a.salePrice;
          final bSale = b.salePrice;

          if (bSale > 0 && aSale > 0) {
            return bSale.compareTo(aSale); // Higher sale first
          } else if (bSale > 0) {
            return 1; // b has sale, a doesn't
          } else if (aSale > 0) {
            return -1; // a has sale, b doesn't
          } else {
            return 0; // Neither has sale
          }
        });
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    // Assign products to the 'Products' list
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
