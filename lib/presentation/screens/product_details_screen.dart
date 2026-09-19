import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_data.dart';
import 'package:sneakers_shop_ui/core/app_icons.dart';
import 'package:sneakers_shop_ui/core/app_textstyles.dart';
import 'package:sneakers_shop_ui/core/models/product.dart';
import 'package:sneakers_shop_ui/presentation/widgets/app_header.dart';
import 'package:sneakers_shop_ui/presentation/widgets/floating_bottom_nav.dart';
import 'package:sneakers_shop_ui/router/router.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final Product? _product = AppData.productById(widget.productId);
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 3;
  int _selectedTabIndex = 0;
  bool _isFavorite = false;
  bool _expandedDescription = false;

  static const _tabRoutes = [
    NamedRoutes.home,
    NamedRoutes.search,
    NamedRoutes.favorites,
    NamedRoutes.profile,
  ];

  @override
  Widget build(BuildContext context) {
    final product = _product;
    if (product == null) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(showBack: true, title: StringConst.productDetails, onLeadingTap: () => context.pop()),
              const Expanded(child: Center(child: Text(StringConst.productNotFound, style: AppTextStyles.sectionTitle))),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                AppHeader(
                  showBack: true,
                  title: StringConst.productDetails,
                  onLeadingTap: () => context.pop(),
                ),
                Expanded(
                  child: ListView(
                    padding: .only(left: 20, right: 20, bottom: FloatingBottomNav.height + 32),
                    children: [
                      _buildImageSection(product),
                      const SizedBox(height: 20),
                      _buildColorOptions(product),
                      const SizedBox(height: 24),
                      _buildTitleRow(product),
                      const SizedBox(height: 24),
                      _buildSizeSelector(product),
                      const SizedBox(height: 28),
                      _buildDetailTabs(product),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FloatingBottomNav(
              currentIndex: 0,
              onTap: (index) => context.go(_tabRoutes[index].routeName),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(Product product) {
    return AspectRatio(
      aspectRatio: 1.15,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: product.bgColor ?? AppColors.imageWell,
              borderRadius: .circular(24),
            ),
            padding: .all(24),
            child: Image.asset(product.imageAsset, fit: .contain),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: () => setState(() => _isFavorite = !_isFavorite),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: .circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cardShadow,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                alignment: .center,
                child: SvgPicture.asset(
                  AppIcons.heart,
                  width: 20,
                  height: 20,
                  colorFilter: .mode(
                    _isFavorite ? AppColors.primary : AppColors.primary,
                    .srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOptions(Product product) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        spacing: 10,
        children: [
          for (var i = 0; i < product.colors.length; i++)
            _buildColorChip(option: product.colors[i], index: i),
        ],
      ),
    );
  }

  Widget _buildColorChip({required ProductColorOption option, required int index}) {
    final isSelected = _selectedColorIndex == index;
    final isWhite = option.color == AppColors.colorWhite;
    return GestureDetector(
      onTap: () => setState(() => _selectedColorIndex = index),
      child: Container(
        padding: .symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textPrimary : AppColors.white,
          borderRadius: .circular(24),
          border: isSelected ? null : .all(color: AppColors.divider),
        ),
        child: Row(
          mainAxisSize: .min,
          spacing: 8,
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: option.color,
                shape: .circle,
                border: isWhite ? .all(color: AppColors.divider) : null,
              ),
            ),
            Text(
              option.name,
              style: isSelected ? AppTextStyles.colorLabel : AppTextStyles.colorLabelInactive,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleRow(Product product) {
    return Row(
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 6,
            children: [
              Text(product.name, style: AppTextStyles.detailTitle),
              Text(product.subtitle, style: AppTextStyles.detailSubtitle),
            ],
          ),
        ),
        Text('\$ ${product.price.toStringAsFixed(2)}', style: AppTextStyles.detailPrice),
      ],
    );
  }

  Widget _buildSizeSelector(Product product) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 14,
      children: [
        Text(StringConst.selectSize, style: AppTextStyles.sectionTitle),
        Row(
          spacing: 12,
          children: [
            for (var i = 0; i < product.sizes.length; i++)
              _buildSizeChip(size: product.sizes[i], index: i),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeChip({required int size, required int index}) {
    final isSelected = _selectedSizeIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedSizeIndex = index),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          shape: .circle,
          border: isSelected ? null : .all(color: AppColors.divider),
        ),
        alignment: .center,
        child: Text(
          '$size',
          style: isSelected ? AppTextStyles.sizeLabelSelected : AppTextStyles.sizeLabel,
        ),
      ),
    );
  }

  Widget _buildDetailTabs(Product product) {
    final body = _selectedTabIndex == 0 ? product.description : product.deliveryInfo;
    final displayBody = _expandedDescription || body.length <= 120
        ? body
        : '${body.substring(0, 120).trimRight()}...';
    return Column(
      crossAxisAlignment: .start,
      spacing: 14,
      children: [
        Row(
          spacing: 24,
          children: [
            _buildTabLabel(label: StringConst.descriptions, index: 0),
            _buildTabLabel(label: StringConst.deliveryAndFreeReturns, index: 1),
          ],
        ),
        Text(displayBody, style: AppTextStyles.body),
        if (body.length > 120)
          GestureDetector(
            onTap: () => setState(() => _expandedDescription = !_expandedDescription),
            child: Text(
              _expandedDescription ? StringConst.seeLess : StringConst.seeMore,
              style: AppTextStyles.seeMore,
            ),
          ),
      ],
    );
  }

  Widget _buildTabLabel({required String label, required int index}) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() {
        _selectedTabIndex = index;
        _expandedDescription = false;
      }),
      child: Column(
        spacing: 6,
        children: [
          Text(label, style: isSelected ? AppTextStyles.tabLabel : AppTextStyles.tabLabelInactive),
          Container(
            height: 2,
            width: isSelected ? 28 : 0,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
