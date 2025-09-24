import 'package:fruit_hub/features/check_out/data/models/order_product_model.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAdressModel;
  final String paymentMethod;
  final List<OrderProductModel> orderProductModel;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAdressModel,
    required this.paymentMethod,
    required this.orderProductModel,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
    uId: orderEntity.uId,
    shippingAdressModel: ShippingAddressModel.fromEntity(
      orderEntity.shippingAdressEntity!,
    ),
    paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'Paypal',
    orderProductModel: orderEntity.cartEntity.cartItemsList
        .map((e) => OrderProductModel.fromEntity(e))
        .toList(),
  );

  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'shippingAdressModel': shippingAdressModel.toJson(),
    'paymentMethod': paymentMethod,
    'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
  };
}
