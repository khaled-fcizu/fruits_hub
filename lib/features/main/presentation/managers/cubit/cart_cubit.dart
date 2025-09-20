import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItemsList: []);
  addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.addProduct(productEntity);
    if (isProductExist) {
      cartItem.incrementQuantity();
    } else {
      cartEntity.addProduct(productEntity);
    }
    emit(CartProductAdded());
  }
}
