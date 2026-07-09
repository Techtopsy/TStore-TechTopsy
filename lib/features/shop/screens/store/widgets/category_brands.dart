import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brand/t_brand_showcase.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        return const TBrandShowcase(images: [
          TImages.productImage3,
          TImages.productImage2,
          TImages.productImage1
        ]);
      },
    );
  }
}
