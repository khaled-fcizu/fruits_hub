import 'package:fruit_hub/core/utils/app_assets.dart';

class BottomNavBarEntity {
  final String activeImage, inactiveImage;
  final String name;
  BottomNavBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.name,
  });
static  List<BottomNavBarEntity> get bottomNavBarItems => [
    BottomNavBarEntity(
      activeImage: Assets.assetsSvgsInlinedHome,
      inactiveImage: Assets.assetsSvgsOutlinedHome,
      name: 'الرئيسية',
    ),
    BottomNavBarEntity(
      activeImage: Assets.assetsSvgsInlinedProducts,
      inactiveImage: Assets.assetsSvgsOutlinedProduct,
      name: 'المنتجات',
    ),
    BottomNavBarEntity(
      activeImage: Assets.assetsSvgsInlinedShoppingCart,
      inactiveImage: Assets.assetsSvgsOutlinedShoppingCart,
      name: 'سلة التسوق',
    ),
    BottomNavBarEntity(
      activeImage: Assets.assetsSvgsInlinedUser,
      inactiveImage: Assets.assetsSvgsOutlinedUser,
      name: 'حسابي',
    ),
  ];
}
