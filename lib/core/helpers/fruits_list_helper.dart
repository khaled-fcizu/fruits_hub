import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/models/product_model.dart';

ProductEntity getProductEntity(){
  return ProductModel(
    avgRating: 4.75, // ممكن تحسبها بالـ getAvgRating
    sellingCount: 120,
    productName: "Organic Apple",
    code: "APL001",
    price: 2.5,
    description: "Fresh organic red apple imported from Italy.",
    imageUrl: "https://hfbfsuvetdhtfsrsewpb.supabase.co/storage/v1/object/public/images/images/IMG_20240929_002125.jpg..jpg",
    isFeatured: true,
    calorieSUnitAmount: 100,
    numberOfCalories: 52,
    isOrganic: true,
    expirationMonths: 3,
    reviews: [],
  ).toEntity();
}

List<ProductEntity> getProductsList(){
  return List.generate(10, (index) => getProductEntity());
}