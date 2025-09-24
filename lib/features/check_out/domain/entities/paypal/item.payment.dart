import 'package:fruit_hub/core/helpers/get_currancy.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromEntity(CartItemEntity cartItemEntity) => Item(
    name: cartItemEntity.productEntity.productName,
    quantity: cartItemEntity.quantity,
    price: cartItemEntity.productEntity.price.toString(),
    currency: getCurrancy(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
