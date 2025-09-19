import 'package:fruit_hub/core/entities/review_entity.dart';



class ProductEntity {
  final num sellingCount;
  final String productName;
  final String description;
  final String code;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int calorieSUnitAmount;
  final num avgRating;
  final int totalRatings = 0;
  final List<ReviewEntity> reviews;

  ProductEntity( {
    this.avgRating = 0,
    this.sellingCount = 0,
    required this.reviews,
    required this.calorieSUnitAmount,
    required this.numberOfCalories,
    this.isOrganic = false,
    required this.expirationMonths,
    required this.productName,
    required this.code,
    required this.price,
    required this.description,
    this.imageUrl,
    this.isFeatured = false,
  });
}
