
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

  toJson() => {
    'reviewDescription': reviewDescription,
    'rating': rating,
    'date': date,
    'userName': userName,
    'userImage': userImage,
  };
}
