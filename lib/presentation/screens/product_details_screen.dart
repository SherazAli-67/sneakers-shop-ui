import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_textstyles.dart';
import 'package:sneakers_shop_ui/presentation/widgets/app_header.dart';
import 'package:sneakers_shop_ui/presentation/widgets/floating_bottom_nav.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              showBack: true,
              title: StringConst.productDetails,
              onLeadingTap: () => context.pop(),
            ),
            Expanded(
              child: Padding(
                padding: .only(bottom: FloatingBottomNav.height + 24),
                child: Center(child: Text(productId, style: AppTextStyles.sectionTitle)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
