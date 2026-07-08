import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/firestore_storage.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore Instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts({int limit = 4}) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(limit)
          .get();

      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching products.';
    }
  }

  /// Upload dummy data to the cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = TFirebaseStorageService.instance;

      for (var product in products) {
        // Upload thumbnail
        final thumbnailData =
            await storage.getImageDataFromAssets(product.thumbnail);
        final thumbnailUrl = await storage.uploadImageData(
          'Products/Images',
          thumbnailData,
          '${product.id}_thumbnail',
        );

        // Upload additional images
        List<String>? imageUrls;
        if (product.images != null && product.images!.isNotEmpty) {
          imageUrls = [];
          for (var image in product.images!) {
            final imageData = await storage.getImageDataFromAssets(image);
            final imageUrl = await storage.uploadImageData(
              'Products/Images',
              imageData,
              '${product.id}_image_${imageUrls.length}',
            );
            imageUrls.add(imageUrl);
          }
        }

        // Create updated product with URLs (immutable)
        final updatedProduct = product.copyWith(
          thumbnail: thumbnailUrl,
          images: imageUrls,
        );

        // Save to Firestore
        await _db
            .collection('Products')
            .doc(updatedProduct.id)
            .set(updatedProduct.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while uploading products.';
    }
  }
}
