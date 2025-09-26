import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsEntity.fromEntity(OrderInputEntity orderEntity) =>
      DetailsEntity(
        subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
        shipping: orderEntity.calculateShippingCost().toString(),
        shippingDiscount: orderEntity.calculateShippingDiscount(),
      );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
