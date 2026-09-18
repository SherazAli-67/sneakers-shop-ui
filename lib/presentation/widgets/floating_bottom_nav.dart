import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_icons.dart';

class FloatingBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback? onScanTap;

  const FloatingBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.onScanTap,
  });

  static const height = 72.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: .fromLTRB(24, 0, 24, 12),
        child: SizedBox(
          height: height,
          child: Stack(
            alignment: .bottomCenter,
            clipBehavior: .none,
            children: [
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: .circular(32),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.cardShadow,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(child: _buildNavItem(icon: AppIcons.home, index: 0)),
                    Expanded(child: _buildNavItem(icon: AppIcons.search, index: 1)),
                    const SizedBox(width: 56),
                    Expanded(child: _buildNavItem(icon: AppIcons.heart, index: 2)),
                    Expanded(child: _buildNavItem(icon: AppIcons.user, index: 3)),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: onScanTap,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: .circular(14),
                      border: .all(color: AppColors.divider, width: 1.5),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.cardShadow,
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.qr_code_scanner_rounded, size: 24, color: AppColors.textPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required String icon, required int index}) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: .opaque,
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: .mode(
            isSelected ? AppColors.primary : AppColors.textPrimary,
            .srcIn,
          ),
        ),
      ),
    );
  }
}
