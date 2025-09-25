import 'package:fruit_hub/core/helpers/get_currancy.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import 'details.payment.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity orderEntity) {
    return Amount(
      total: orderEntity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrancy(),
      details: DetailsEntity.fromEntity(orderEntity),
    );
  }
  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
