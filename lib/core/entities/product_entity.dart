import 'dart:io';

import 'package:fruit_hub/core/entities/review_entity.dart';



class ProductEntity {
  final String productName;
  final String description;
  final String code;
  final num price;
  final File? image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int calorieSUnitAmount;
  final int avgrating = 0;
  final int totalRatings = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.reviews,
    required this.calorieSUnitAmount,
    required this.numberOfCalories,
    this.isOrganic = false,
    required this.expirationMonths,
    required this.productName,
    required this.code,
    required this.price,
    required this.description,
    this.image,
    this.imageUrl,
    this.isFeatured = false,
  });
}
