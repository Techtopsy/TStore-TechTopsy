import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/personalization/model/user_model.dart';
import 'package:t_store/routes/routes.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: TImages.banner1,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner2,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner3,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner4,
      targetScreen: TRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner5,
      targetScreen: TRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner6,
      targetScreen: TRoutes.userAddress,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner7,
      targetScreen: TRoutes.checkout,
      active: true,
    ),
  ];

  /// -- User
  static final UserModel user = UserModel(
    id: '1',
    username: 'coding_with_t',
    firstName: 'Coding',
    lastName: 'with T',
    email: 'support@codingwithT.com',
    phoneNumber: '+14155552671',
    profilePicture: TImages.user,
  );

  /// --- Cart

  /// --- Order

  /// --- List of all Categories
  static final List<CategoryModel> categories = [
    // Main Categories
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: TImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      image: TImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      image: TImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      image: TImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      image: TImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: TImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      image: TImages.cosmeticsIcon,
      isFeatured: true,
    ),

    // Sub-Categories (Sports)
    CategoryModel(
      id: '8',
      name: 'Sport Shoes',
      image: TImages.shoeIcon,
      isFeatured: false,
      parentId: '1',
    ),
    CategoryModel(
      id: '9',
      name: 'Track Suits',
      image: TImages.sportIcon,
      isFeatured: false,
      parentId: '1',
    ),
    CategoryModel(
      id: '10',
      name: 'Sports Equipment',
      image: TImages.sportIcon,
      isFeatured: false,
      parentId: '1',
    ),

    // Sub-Categories (Furniture)
    CategoryModel(
      id: '11',
      name: 'Sofas',
      image: TImages.furnitureIcon,
      isFeatured: false,
      parentId: '5',
    ),
    CategoryModel(
      id: '12',
      name: 'Tables',
      image: TImages.furnitureIcon,
      isFeatured: false,
      parentId: '5',
    ),
    CategoryModel(
      id: '13',
      name: 'Chairs',
      image: TImages.furnitureIcon,
      isFeatured: false,
      parentId: '5',
    ),

    // Sub-Categories (Electronics)
    CategoryModel(
      id: '14',
      name: 'Laptops',
      image: TImages.electronicsIcon,
      isFeatured: false,
      parentId: '2',
    ),
    CategoryModel(
      id: '15',
      name: 'Phones',
      image: TImages.electronicsIcon,
      isFeatured: false,
      parentId: '2',
    ),
  ];
}
