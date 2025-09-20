num getAvgRating(List<dynamic> reviews) {
  if (reviews.isEmpty) return 0;
  var sum = 0.0;
  for (var i = 0; i < reviews.length; i++) {
    sum += reviews[i]['rating'];
  }
  return sum / reviews.length;
}
