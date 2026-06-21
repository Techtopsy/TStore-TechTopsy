import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TprimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar -- Tutorial [Section # 3, Video # 3]
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar -- Tutorial [Section # 3, Video # 4]
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories -- Tutorial [Section # 3, Video # 4]
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories(), // SizedBox
                      ],
                    ), // Column
                  ) // Padding
                ],
              ),
            ), // 

            // body
 Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider -- Tutorial [Section # 3, Video # 6]
                  const TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
                  const SizedBox(height: TSizes.spaceBtwSections),
    
                     TSectionHeading(
                          title: 'Popular Products',
                          onPressed: () => Get.to(() => const AllProducts()),
                          textColor: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,
                        ),

                        const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  /// -- Popular Products -- Tutorial [Section # 3, Video # 7]
                  TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical()),
                ],
              ),
            ), // Padding

          ],
        ),
      ),
    );
  }
}
