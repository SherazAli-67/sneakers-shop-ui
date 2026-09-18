import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_icons.dart';
import 'package:sneakers_shop_ui/core/models/brand.dart';
import 'package:sneakers_shop_ui/core/models/product.dart';

class AppData {
  static const brands = <Brand>[
    Brand(
      id: 'adidas',
      name: 'Adidas',
      logoAsset: AppIcons.adidasLogo,
      accentColor: AppColors.brandAdidas,
    ),
    Brand(
      id: 'nike',
      name: 'Nike',
      logoAsset: AppIcons.nikeLogo,
      accentColor: AppColors.brandNike,
    ),
    Brand(
      id: 'reebok',
      name: 'Reebok',
      logoAsset: AppIcons.reebokLogo,
      accentColor: AppColors.brandReebok,
    ),
    Brand(
      id: 'puma',
      name: 'Puma',
      logoAsset: AppIcons.pumaLogo,
      accentColor: AppColors.brandPuma,
    ),
  ];

  static const _defaultColors = <ProductColorOption>[
    ProductColorOption(name: 'White', color: AppColors.colorWhite),
    ProductColorOption(name: 'Pink', color: AppColors.colorPink),
    ProductColorOption(name: 'Blue', color: AppColors.colorBlue),
    ProductColorOption(name: 'Orange', color: AppColors.colorOrange),
  ];

  static const _defaultSizes = <int>[38, 39, 40, 41, 42];

  static const _defaultDeliveryInfo =
      'Free standard delivery on orders over \$50. Express shipping available at checkout. Easy free returns within 30 days of delivery.';

  static const featuredProduct = Product(
    id: 'qc-lifestyle',
    name: 'QC Lifestyle Sneaker',
    brandTag: 'QC',
    imageAsset: AppIcons.promoBannerShoe,
    rating: 4.8,
    price: 120.50,
    subtitle: 'Lightweight Power shoe for men',
    description:
        'Get 360 degrees of comfort & style combined in QC Lifestyle. Engineered with a breathable upper and cushioned sole for all-day wear on and off the court.',
    deliveryInfo: _defaultDeliveryInfo,
    colors: _defaultColors,
    sizes: _defaultSizes,
    brandLogoImg: AppIcons.nikeLogo

  );

  static const promoDescription =
      'Get 360 degrees of comfort & style combined in QC Lifestyle. Engineered with a breathable \nupper and cushioned sole for all-day wear on and off the court.';

  static const newArrivals = <Product>[
    Product(
      id: 'adidas-run-falcon',
      name: 'Adidas Run Falcon 2.0',
      brandTag: 'JXV',
      imageAsset: AppIcons.adidasShoes,
      rating: 4.5,
      price: 60.80,
      oldPrice: 80.00,
      subtitle: 'Everyday running shoe',
      description:
          'A versatile runner built for daily miles with a lightweight feel and secure fit that keeps you moving comfortably.',
      deliveryInfo: _defaultDeliveryInfo,
      colors: _defaultColors,
      sizes: _defaultSizes,
      bgColor: AppColors.lightOrange,
      brandLogoImg: AppIcons.adidasLogo
    ),
    Product(
      id: 'nike-air-force',
      name: 'Nike Air Force 1',
      brandTag: 'NK',
      imageAsset: AppIcons.nikeAirForceShoes,
      rating: 4.7,
      price: 95.00,
      oldPrice: 110.00,
      subtitle: 'Classic court style',
      description:
          'Iconic silhouette with durable leather overlays and a cushioned midsole for timeless street-ready comfort.',
      deliveryInfo: _defaultDeliveryInfo,
      colors: _defaultColors,
      sizes: _defaultSizes,
      bgColor: AppColors.shoesBgColorGrey,
      brandLogoImg: AppIcons.nikeLogo
    ),
    Product(
      id: 'trail-cruiser',
      name: 'Trail Cruiser Sneaker',
      brandTag: 'TC',
      imageAsset: AppIcons.trailCruiserShoes,
      rating: 4.3,
      price: 72.40,
      oldPrice: 89.00,
      subtitle: 'All-terrain casual shoe',
      description:
          'Rugged outsole grip meets everyday style so you can take city streets and light trails in the same pair.',
      deliveryInfo: _defaultDeliveryInfo,
      colors: _defaultColors,
      sizes: _defaultSizes,
      bgColor: AppColors.lightPinkColor,
      brandLogoImg: AppIcons.pumaLogo
    ),
    Product(
      id: 'puma-runner',
      name: 'Puma Soft Ride',
      brandTag: 'PM',
      imageAsset: AppIcons.pumaShoes,
      rating: 4.4,
      price: 68.90,
      oldPrice: 85.00,
      subtitle: 'Soft cushioned runner',
      description:
          'SoftFoam+ cushioning and a flexible upper deliver a smooth stride for training days and casual wear.',
      deliveryInfo: _defaultDeliveryInfo,
      colors: _defaultColors,
      sizes: _defaultSizes,
      bgColor: AppColors.lightOrange,
      brandLogoImg: AppIcons.reebokLogo
    ),
    Product(
      id: 'red-sprint',
      name: 'Sprint Red Edition',
      brandTag: 'SR',
      imageAsset: AppIcons.redShoes,
      rating: 4.6,
      price: 78.50,
      oldPrice: 99.00,
      subtitle: 'Bold performance sneaker',
      description:
          'Standout red accents with a responsive midsole designed for speed work and everyday energy.',
      deliveryInfo: _defaultDeliveryInfo,
      colors: _defaultColors,
      sizes: _defaultSizes,
      bgColor: AppColors.shoesBgColorGrey,
      brandLogoImg: AppIcons.nikeLogo
    ),
    Product(
      id: 'black-urban',
      name: 'Urban Black Low',
      brandTag: 'UB',
      imageAsset: AppIcons.blackShoes,
      rating: 4.5,
      price: 70.00,
      oldPrice: 88.00,
      subtitle: 'Minimal street low-top',
      description:
          'Clean black profile with a padded collar and grippy sole for all-day urban comfort.',
      deliveryInfo: _defaultDeliveryInfo,
      colors: _defaultColors,
      sizes: _defaultSizes,
      bgColor: AppColors.lightPinkColor,
      brandLogoImg: AppIcons.pumaLogo
    ),
  ];

  static Product? productById(String id) {
    if (featuredProduct.id == id) return featuredProduct;
    for (final product in newArrivals) {
      if (product.id == id) return product;
    }
    return null;
  }
}
