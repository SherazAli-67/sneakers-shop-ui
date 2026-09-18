import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_data.dart';
import 'package:sneakers_shop_ui/core/app_icons.dart';
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
                padding: .only(right: 22, top: 100),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
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
    return Container(
      height: .infinity,
      width: 125,
      color: AppColors.white.withValues(alpha: 0.1),
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          StringConst.welcomeWatermark,
          style: AppTextStyles.welcomeWatermark,
          maxLines: 1,
          textAlign: .center,
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
          SvgPicture.asset(AppIcons.icArrowLine,),
          Text(StringConst.welcomeSneakers, style: AppTextStyles.welcomeSneakers),
        ],
      ),
    );
  }

  Widget _buildSneaker(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      left: size.width * 0.1,
      top: size.height * 0.25,
      child: Transform.rotate(
        angle: 0.15,
        child: Image.asset(
          AppData.welcomeSneakerImage,
          width: size.width * 0.9,
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
