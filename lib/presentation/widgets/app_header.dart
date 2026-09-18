import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_icons.dart';
import 'package:sneakers_shop_ui/core/app_textstyles.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback? onLeadingTap;
  final VoidCallback? onCartTap;
  final String? title;
  final bool showBack;

  const AppHeader({
    super.key,
    this.onLeadingTap,
    this.onCartTap,
    this.title,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 40, height: 40, child: Align(alignment: .centerLeft, child: _buildLeading())),
          Expanded(
            child: title == null
                ? const SizedBox.shrink()
                : Text(title!, style: AppTextStyles.screenTitle, textAlign: .center),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: Align(
              alignment: .centerRight,
              child: GestureDetector(
                onTap: onCartTap,
                child: SvgPicture.asset(
                  AppIcons.cart,
                  width: 24,
                  height: 24,
                  colorFilter: .mode(AppColors.textPrimary, .srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    if (showBack) {
      return GestureDetector(
        onTap: onLeadingTap,
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
          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: AppColors.primary),
        ),
      );
    }
    return GestureDetector(
      onTap: onLeadingTap,
      child: SvgPicture.asset(
        AppIcons.drawerMenu,
        width: 24,
        height: 24,
        colorFilter: .mode(AppColors.textPrimary, .srcIn),
      ),
    );
  }
}
