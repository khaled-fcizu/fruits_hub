import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemsList;

  CartEntity({required this.cartItemsList});
  CartItemEntity addProduct(ProductEntity  productEntity) {
    for( var cartItem in cartItemsList) {
      if(cartItem.productEntity == productEntity) {
        cartItem.incrementQuantity();
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for( var cartItem in cartItemsList) {
      if(cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  bool isExist(ProductEntity productEntity) {
    for( var cartItem in cartItemsList) {
      if(cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }
}