import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_data.dart';
import 'package:sneakers_shop_ui/core/app_textstyles.dart';
import 'package:sneakers_shop_ui/router/router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            _buildWatermark(context),
            _buildSneaker(context),
            SafeArea(
              child: Padding(
                padding: .symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    const SizedBox(height: 48),
                    _buildHeadline(),
                    const Spacer(),
                    Align(alignment: .centerRight, child: _buildCta(context)),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWatermark(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Positioned(
      left: -40,
      top: height * 0.12,
      bottom: height * 0.08,
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          StringConst.welcomeWatermark,
          style: AppTextStyles.welcomeWatermark.copyWith(
            fontSize: height * 0.14,
            foreground: Paint()
              ..style = .stroke
              ..strokeWidth = 1.5
              ..color = AppColors.watermark,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Align(
      alignment: .centerRight,
      child: Column(
        crossAxisAlignment: .end,
        spacing: 4,
        children: [
          Text(StringConst.welcomeComfortable, style: AppTextStyles.welcomeHeadline),
          Text(StringConst.welcomeFashionable, style: AppTextStyles.welcomeHeadline),
          const SizedBox(height: 8),
          _buildSneakersChip(),
        ],
      ),
    );
  }

  Widget _buildSneakersChip() {
    return Container(
      padding: .symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: .circular(4),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Text(StringConst.welcomeSneakers, style: AppTextStyles.welcomeSneakers),
          const Icon(Icons.arrow_forward_rounded, size: 18, color: AppColors.textPrimary),
        ],
      ),
    );
  }

  Widget _buildSneaker(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      left: -size.width * 0.08,
      top: size.height * 0.22,
      child: Transform.rotate(
        angle: -0.35,
        child: Image.asset(
          AppData.welcomeSneakerImage,
          width: size.width * 0.95,
          fit: .contain,
        ),
      ),
    );
  }

  Widget _buildCta(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(NamedRoutes.home.routeName),
      child: Container(
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: .circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.arrow_forward_rounded, size: 28, color: AppColors.primary),
      ),
    );
  }
}
