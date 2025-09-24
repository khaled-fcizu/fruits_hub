import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final num price;
  final int quantity;
  final String imageUrl;
  final String code;

  OrderProductModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.code,
  });

  factory OrderProductModel.fromEntity(CartItemEntity cartItem) {
    return OrderProductModel(
      name: cartItem.productEntity.productName,
      price: cartItem.productEntity.price,
      quantity: cartItem.quantity,
      imageUrl: cartItem.productEntity.imageUrl!,
      code: cartItem.productEntity.code,
    );
  }

  toJson() => {
        'name': name,
        'price': price,
        'quantity': quantity,
        'imageUrl': imageUrl,
        'code': code,
      };
}