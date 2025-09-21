import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemsList;

  CartEntity({required this.cartItemsList});
  addItem(CartItemEntity cartItemEntity) {
    cartItemsList.add(cartItemEntity);
  }

  removeItem(CartItemEntity cartItemEntity) {
    cartItemsList.remove(cartItemEntity);
  }
  
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItemsList) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }
  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var cartItem in cartItemsList) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in cartItemsList) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }
}
