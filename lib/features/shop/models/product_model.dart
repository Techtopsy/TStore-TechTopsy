import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class ProductModel {
  final String id;
  final int stock;
  final String? sku;
  final double price;
  final String title;
  final DateTime? date;
  final double salePrice;
  final String thumbnail;
  final bool? isFeatured;
  final BrandModel? brand;
  final String? description;
  final String? categoryId;
  final List<String>? images;
  final String productType;
  final List<ProductAttributeModel>? productAttributes;
  final List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.date,
    this.salePrice = 0.0,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    this.productAttributes,
    this.productVariations,
  });

  /// Create Empty function from clean code
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0.0,
        thumbnail: '',
        productType: '',
      );

  /// Json Format
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Image': images ?? [],
      'Thumbnail': thumbnail,
      'SalesPrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['title'],
      stock: data['stock'] ?? 0,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['thumbnail'] ?? '',
      productType: data['productType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
  // Map Json oriented document snapShot from Firebase to Model
  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['title'],
      stock: data['stock'] ?? 0,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['thumbnail'] ?? '',
      productType: data['productType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['images'] != null ? List<String>.from(data['Images']) : [],
    );
  }
}
