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

  factory PaypalPaymentEntity.fromEntity(PaypalPaymentEntity entity) =>
      PaypalPaymentEntity(
        amount: entity.amount,
        description: entity.description,
        itemList: entity.itemList,
      );
}
