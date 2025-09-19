import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/entities/review_entity.dart';
import 'package:fruit_hub/core/helpers/get_avg_rating.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.avgRating,
    required super.sellingCount,
    required super.productName,
    required super.code,
    required super.price,
    required super.description,
    required super.imageUrl,
    required super.isFeatured,
    required super.calorieSUnitAmount,
    required super.numberOfCalories,
    required super.isOrganic,
    required super.expirationMonths,
    required super.reviews,
  });

  toJson() => {
    'reviews': reviews.map((e) => ReviewModel.formEntity(e).toJson()).toList(),
    'productName': productName,
    'code': code,
    'price': price,
    'description': description,
    'imageUrl': imageUrl,
    'isFeatured': isFeatured,
    'calorieSUnitAmount': calorieSUnitAmount,
    'numberOfCalories': numberOfCalories,
    'isOrganic': isOrganic,
    'expirationMonths': expirationMonths,
    'sellingCount': sellingCount,
  };

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    avgRating: getAvgRating(json['reviews']?? [])  ,
    sellingCount: json['sellingCount'],
    reviews: json['reviews'] != null
        ? (json['reviews'] as List).map((e) => ReviewModel.fromJson(e as Map<String, dynamic>)).toList().cast<ReviewEntity>() 
        : <ReviewModel>[],
    isFeatured: json['isFeatured'],
    productName: json['productName'],
    code: json['code'],
    price: json['price'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    calorieSUnitAmount: json['calorieSUnitAmount'],
    numberOfCalories: json['numberOfCalories'],
    isOrganic: json['isOrganic'],
    expirationMonths: json['expirationMonths'],
  );

  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
    avgRating: entity.avgRating,
    sellingCount: entity.sellingCount,
    reviews: entity.reviews.map((e) => ReviewModel.formEntity(e)).toList(),
    isFeatured: entity.isFeatured,
    productName: entity.productName,
    code: entity.code,
    price: entity.price,
    description: entity.description,
    imageUrl: entity.imageUrl,
    calorieSUnitAmount: entity.calorieSUnitAmount,
    numberOfCalories: entity.numberOfCalories,
    isOrganic: entity.isOrganic,
    expirationMonths: entity.expirationMonths,
  );

  ProductEntity toEntity() {
    return ProductEntity(
      sellingCount: sellingCount,
      reviews: reviews
          .map((e) => ReviewModel.formEntity(e).toEntity())
          .toList(),
      isFeatured: isFeatured,
      productName: productName,
      code: code,
      price: price,
      description: description,
      imageUrl: imageUrl,
      calorieSUnitAmount: calorieSUnitAmount,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      expirationMonths: expirationMonths,
    );
  }
}
