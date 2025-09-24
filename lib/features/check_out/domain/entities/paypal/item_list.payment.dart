import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';

import 'item.payment.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  
  factory ItemList.fromEntity(CartEntity cartEntity) {
    return ItemList(
      items: cartEntity.cartItemsList.map((e) => Item.fromEntity(e)).toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
