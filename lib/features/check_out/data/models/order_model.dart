import 'package:fruit_hub/features/check_out/data/models/order_product_model.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAdressModel;
  final String paymentMethod;
  final List<OrderProductModel> orderProductModel;
  final String orderId;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.uId,
    required this.shippingAdressModel,
    required this.paymentMethod,
    required this.orderProductModel,
  });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) => OrderModel(
    orderId: Uuid().v4(),
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
    'orderId': orderId,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAdressModel': shippingAdressModel.toJson(),
    'paymentMethod': paymentMethod,
    'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
  };
}
