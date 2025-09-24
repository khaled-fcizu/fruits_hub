import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import 'amount.payment.dart';
import 'item_list.payment.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  factory PaypalPaymentEntity.fromEntity(OrderEntity orderEntity) =>
      PaypalPaymentEntity(
        amount: Amount.fromEntity(orderEntity),
        description: 'payment description',
        itemList: ItemList.fromEntity(orderEntity.cartEntity),
      );
}
