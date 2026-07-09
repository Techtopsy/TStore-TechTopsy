import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      // Show loader while loading products
      isLoading.value = true;

      // Fetch Products
      final products = await ProductRepository.instance.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      /// Fetch Products
      final products = await ProductRepository.instance.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    // Single product type
    if (product.productType == ProductType.single.toString()) {
      final price = (product.salePrice > 0) ? product.salePrice : product.price;
      return '\$$price';
    }

    // Variation product type
    if (product.productVariations == null ||
        product.productVariations!.isEmpty) {
      return '\$${product.price}';
    }

    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    for (var variation in product.productVariations!) {
      final salePrice = variation.salePrice ?? 0.0;
      final regularPrice = variation.price ?? 0.0;
      double priceToConsider = salePrice > 0.0 ? salePrice : regularPrice;

      if (priceToConsider < smallestPrice) {
        smallestPrice = priceToConsider;
      }
      if (priceToConsider > largestPrice) {
        largestPrice = priceToConsider;
      }
    }

    if (smallestPrice == largestPrice) {
      // ✅ Fixed: == instead of isEqual
      return '\$$largestPrice';
    } else {
      return '\$$smallestPrice - \$$largestPrice';
    }
  }

  /// Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0.0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return '${percentage.toStringAsFixed(0)}%'; // ✅ Added % symbol
  }

  /// Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
