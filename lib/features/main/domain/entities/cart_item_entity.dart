import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 0});
  calculateTotalPrice() => productEntity.price * quantity;
  calculateTotalWeight() => productEntity.calorieSUnitAmount * quantity;
  incrementQuantity() => quantity++;
  decrementQuantity() => quantity--;

  @override
  List<Object?> get props => [productEntity];
}
