import 'package:flutter/material.dart';

class Brand {
  final String id;
  final String name;
  final String logoAsset;
  final Color accentColor;

  const Brand({
    required this.id,
    required this.name,
    required this.logoAsset,
    required this.accentColor,
  });
}
