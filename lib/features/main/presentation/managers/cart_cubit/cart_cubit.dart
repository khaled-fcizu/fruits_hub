import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItemsList: []);
  addProduct(ProductEntity productEntity, {int quantity = 1}) {
    bool isProductExist = cartEntity.isExist(productEntity);
    CartItemEntity cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.addQuantity(quantity);
    } else {
      cartEntity.addItem(CartItemEntity(productEntity: productEntity,quantity: quantity ));
    }
    emit(CartProductAdded());
  }

  removeProduct(ProductEntity productEntity) {
    var cartItemEntity = cartEntity.getCartItem(productEntity);
    cartEntity.removeItem(cartItemEntity);
    emit(CartProductRemoved());
  }
}
