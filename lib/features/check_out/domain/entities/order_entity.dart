import 'package:fruit_hub/features/check_out/domain/entities/adress_phase_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  final AdressPhaseEntity? adressPhaseEntity;
  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    this.adressPhaseEntity,
  });
}
