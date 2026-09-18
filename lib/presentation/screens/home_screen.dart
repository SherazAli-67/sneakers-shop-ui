import 'package:flutter/material.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            Expanded(
              child: ListView(
                padding: .only(bottom: FloatingBottomNav.height + 32),
                children: [
                  _buildTopBrands(),
                  const SizedBox(height: 34),
                  _buildPromoBanner(context),
                  const SizedBox(height: 23),
                  _buildNewArrivals(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBrands() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 18,
      children: [
        Padding(
          padding: .symmetric(horizontal: 20),
          child: Text(StringConst.topBrands, style: AppTextStyles.screenTitle),
        ),
        SizedBox(
          height: 72,
          child: ListView.separated(
            scrollDirection: .horizontal,
            padding: .symmetric(horizontal: 20),
            itemCount: AppData.brands.length,
            separatorBuilder: (_, _) => const SizedBox(width: 17),
            itemBuilder: (_, index){
              return Image.asset(AppData.brands[index].logoAsset, fit: .contain);
            }
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    final product = AppData.featuredProduct;
    return Padding(
      padding: .symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => context.push('${NamedRoutes.product.routeName}/${product.id}'),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: .circular(24),
          ),
          child: Stack(
            clipBehavior: .none,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                padding: .symmetric(horizontal: 19, vertical: 10),
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 8,
                  children: [
                    Text(product.name, style: AppTextStyles.promoTitle),
                    Text(AppData.promoDescription, style: AppTextStyles.promoBody, maxLines: 2, overflow: .ellipsis),

                    Container(
                      width: 36,
                      height: 36,
                      margin: .only(top: 16),
                      decoration: const BoxDecoration(color: AppColors.white, shape: .circle),
                      child: const Icon(Icons.arrow_forward_rounded, size: 18, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child:  Image.asset(product.imageAsset, width: 275,),
              ),
              Positioned(
                left: -60,
                bottom: -80,
                child: Image.asset(AppIcons.ripplePromoBannerImg),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewArrivals(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 16,
        children: [
          Text(StringConst.newArrivals, style: AppTextStyles.screenTitle.copyWith(fontWeight: .w500)),
          ...AppData.newArrivals.map((product) => _buildProductListItem(context, product)),
        ],
      ),
    );
  }

  Widget _buildProductListItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () => context.push('${NamedRoutes.product.routeName}/${product.id}'),
      child: Container(
        // padding: .all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: .circular(6),
          boxShadow:  [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.016),
              blurRadius: 135,
              spreadRadius: 0,
              offset: Offset(0, 71),
            ),
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.0229),
              blurRadius: 80.38,
              spreadRadius: 0,
              offset: Offset(0, 33.58),
            ),
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.07),
              blurRadius: 31.95,
              spreadRadius: 0,
              offset: Offset(0, 8.24),
            ),
          ],
        ),
        child: Row(
          spacing: 14,
          children: [
            SizedBox(
              height: 70,
              width: 80,
              child: Stack(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: product.bgColor,
                      borderRadius: .only(topLeft: .circular(6), bottomLeft: .circular(6)),
                    ),
                    child: Image.asset(product.imageAsset, fit: .contain),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Align(
                          alignment: .center,
                          child: Image.asset(product.brandLogoImg, height: 17, width: 17, fit: .cover,)))
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 6,
                children: [
                  Text(product.name, style: AppTextStyles.sizeLabel.copyWith(fontWeight: .w500), maxLines: 1, overflow: .ellipsis),
                  Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            spacing: 8,
                            crossAxisAlignment: .center,
                            children: [
                              Row(
                                children: List.generate(5, (index){
                                  return Icon(Icons.star_rate_rounded, size: 9,);
                                }),
                              ),
                              Text("5.0", style: AppTextStyles.promoBody.copyWith(color: AppColors.black),)
                            ],
                          ),
                          Text(product.brandTag, style: AppTextStyles.body,)
                        ],
                      )),
                      Padding(
                        padding: const .only(right: 12.0),
                        child: Column(
                          crossAxisAlignment: .end,
                          children: [
                            Text('\$${product.oldPrice}', style: AppTextStyles.body.copyWith(decoration: .lineThrough)),
                            Text('\$${product.price}', style: AppTextStyles.productPrice,)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
