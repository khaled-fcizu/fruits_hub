import 'package:fruit_hub/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uId;

  final CartEntity cartEntity;
  bool? payWithCash;
  final ShippingAddressEntity? shippingAdressEntity;
  OrderEntity({
    required this.uId,
    required this.cartEntity,
    this.payWithCash = false,
    this.shippingAdressEntity,
  });

  calculateShippingCost() {
    if (payWithCash!) {
      return 20;
    } else {
      return 0;
    }
  }

  calculateShippingDiscount() {
    return 0;
  }

  calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }

 
}
