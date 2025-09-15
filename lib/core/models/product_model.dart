import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel extends ProductEntity {
  final int bestSellingCount;
  ProductModel({
    this.bestSellingCount = 0,
    required super.productName,
    required super.code,
    required super.price,
    required super.description,
    required super.image,
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
    'sellingCount': bestSellingCount,
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
  };

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    reviews: json['reviews'] != null
        ? json['reviews'].map((e) => ReviewModel.fromJson(e)).toList()
        : [],
    isFeatured: json['isFeatured'],
    productName: json['productName'],
    code: json['code'],
    price: json['price'],
    description: json['description'],
    image: json['image'],
    imageUrl: json['imageUrl'],
    calorieSUnitAmount: json['calorieSUnitAmount'],
    numberOfCalories: json['numberOfCalories'],
    isOrganic: json['isOrganic'],
    expirationMonths: json['expirationMonths'],
  );

  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
    reviews: entity.reviews.map((e) => ReviewModel.formEntity(e)).toList(),
    isFeatured: entity.isFeatured,
    productName: entity.productName,
    code: entity.code,
    price: entity.price,
    description: entity.description,
    image: entity.image,
    imageUrl: entity.imageUrl,
    calorieSUnitAmount: entity.calorieSUnitAmount,
    numberOfCalories: entity.numberOfCalories,
    isOrganic: entity.isOrganic,
    expirationMonths: entity.expirationMonths,
  );

  ProductEntity toEntity(){
    return ProductEntity(
      reviews: reviews.map((e) => ReviewModel.formEntity(e).toEntity()).toList(),
      isFeatured: isFeatured,
      productName: productName,
      code: code,
      price: price,
      description: description,
      image: image,
      imageUrl: imageUrl,
      calorieSUnitAmount: calorieSUnitAmount,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      expirationMonths: expirationMonths,
    );
  }
}
