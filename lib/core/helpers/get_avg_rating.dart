import 'package:fruit_hub/core/models/review_model.dart';

num getAvgRating(List<dynamic> reviews) {
  if (reviews.isEmpty) return 0;
  var sum = 0.0;
  for (var i = 0; i < reviews.length; i++) {
    final review = ReviewModel.fromJson(reviews[i] as Map<String, dynamic>);

    sum += reviews[i]['rating'];
  }
  return sum / reviews.length;
}
