import 'package:flutter/material.dart';

class ProductColorOption {
  final String name;
  final Color color;

  const ProductColorOption({
    required this.name,
    required this.color,
  });
}

class Product {
  final String id;
  final String name;
  final String brandTag;
  final String imageAsset;
  final double rating;
  final double price;
  final double? oldPrice;
  final String subtitle;
  final String description;
  final String deliveryInfo;
  final List<ProductColorOption> colors;
  final List<int> sizes;
  final Color? bgColor;
  final String brandLogoImg;

  const Product({
    required this.id,
    required this.name,
    required this.brandTag,
    required this.imageAsset,
    required this.rating,
    required this.price,
    this.oldPrice,
    required this.subtitle,
    required this.description,
    required this.deliveryInfo,
    required this.colors,
    required this.sizes,
    this.bgColor,
    required this.brandLogoImg
  });
}
