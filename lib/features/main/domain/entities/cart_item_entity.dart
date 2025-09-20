import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity,  this.quantity = 0});
  calculateTotalPrice() => productEntity.price * quantity;
  calculateTotalWeight() => productEntity.calorieSUnitAmount * quantity;
  incrementQuantity() => quantity++;
  decrementQuantity() => quantity--;
}
