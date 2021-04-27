import 'package:flutter/material.dart';

class TopHomeCardEntity {
  final String title;
  final String subtitle;
  final String leadingButtonTitle;
  final String trailingButtonTitle;
  final Color startColorGradient;
  final Color endColorGradient;

  TopHomeCardEntity({
    required this.title,
    required this.leadingButtonTitle,
    required this.subtitle,
    required this.trailingButtonTitle,
    required this.startColorGradient,
    required this.endColorGradient,
  });
}
