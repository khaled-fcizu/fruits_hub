class ReviewEntity {
  final String reviewDescription;
  final num rating;
  final String date;
  final String userName;
  final String userImage;

  ReviewEntity({
    required this.reviewDescription,
    required this.rating,
    required this.date,
    required this.userName,
    required this.userImage,
  });
}
