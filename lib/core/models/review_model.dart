import 'package:fruit_hub/core/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.reviewDescription,
    required super.rating,
    required super.date,
    required super.userName,
    required super.userImage,
  });

  factory ReviewModel.formEntity(ReviewEntity entity) {
    return ReviewModel(
      reviewDescription: entity.reviewDescription,
      rating: entity.rating,
      date: entity.date,
      userName: entity.userName,
      userImage: entity.userImage,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewDescription: json['reviewDescription'],
      rating: json['rating'],
      date: json['date'],
      userName: json['userName'],
      userImage: json['userImage'],
    );
  }

  toJson() => {
    'reviewDescription': reviewDescription,
    'rating': rating,
    'date': date,
    'userName': userName,
    'userImage': userImage,
  };

  ReviewEntity toEntity() => ReviewEntity(
    reviewDescription: reviewDescription,
    rating: rating,
    date: date,
    userName: userName,
    userImage: userImage,
  );
}
