import 'package:flutter/material.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';

class AppTextStyles {
  static const welcomeHeadline = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 26,
    height: 1.2,
    color: AppColors.white,
  );

  static const welcomeSneakers = TextStyle(
    fontFamily: StringConst.sneakersTextFontFamily,
    fontWeight: .w700,
    fontSize: 34,
    color: AppColors.white,
  );

  static const welcomeWatermark = TextStyle(
    fontFamily: StringConst.sneakersTextFontFamily,
    fontWeight: .w700,
    fontSize: 96,
    color: AppColors.primary,
  );

  static const sectionTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 18,
    color: AppColors.textPrimary,
  );

  static const productName = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 15,
    color: AppColors.textPrimary,
  );

  static const productSubtitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  static const productPrice = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const productOldPrice = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    color: AppColors.textMuted,
    decoration: .lineThrough,
    decorationColor: AppColors.textMuted,
  );

  static const productRating = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const productTag = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 11,
    color: AppColors.textMuted,
  );

  static const promoTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 18,
    color: AppColors.white,
  );

  static const promoBody = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 12,
    height: 1.4,
    color: AppColors.white,
  );

  static const detailTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 20,
    color: AppColors.textPrimary,
  );

  static const detailPrice = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 20,
    color: AppColors.textPrimary,
  );

  static const detailSubtitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  static const screenTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const tabLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 12,
    letterSpacing: 0.4,
    color: AppColors.textPrimary,
  );

  static const tabLabelInactive = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 12,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );

  static const body = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const seeMore = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 13,
    color: AppColors.primary,
  );

  static const sizeLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 14,
    color: AppColors.textPrimary,
  );

  static const sizeLabelSelected = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 14,
    color: AppColors.white,
  );

  static const colorLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 12,
    color: AppColors.white,
  );

  static const colorLabelInactive = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 12,
    color: AppColors.textPrimary,
  );
}
