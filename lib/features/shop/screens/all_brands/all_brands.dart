import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/brands_shimmer.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/all_brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Brand'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(children: [
                  //heading
                  const TSectionHeading(
                    title: 'Brands',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// -- Brands
                  Obx(
                    () {
                      if (brandController.isLoading.value) {
                        return const TBrandsShimmer();
                      }

                      if (brandController.allBrands.isEmpty) {
                        return Center(
                          child: Text(
                            'No Data Found!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white),
                          ),
                        );
                      }

                      return TGridLayout(
                        itemCount: brandController.allBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = brandController.allBrands[index];
                          return TBrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () =>
                                  Get.to(() => BrandProducts(brand: brand)));
                        },
                      );
                    },
                  )
                ]))));
  }
}
