import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, required this.quantity});
  calculateTotalPrice() => productEntity.price * quantity;
  calculateTotalWeight() => productEntity.calorieSUnitAmount * quantity;
  incrementQuantity() => quantity++;
  decrementQuantity() => quantity--;
}
