import 'package:fruit_hub/features/check_out/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? address;
  String? city;
  String? floor;
  String? phoneNumber;
  String? name;
  String? email;

  ShippingAddressModel({
    this.address,
    this.city,
    this.floor,
    this.phoneNumber,
    this.name,
    this.email,
  });

  toJson() => {
    'address': address,
    'city': city,
    'floor': floor,
    'phoneNumber': phoneNumber,
    'name': name,
    'email': email,
  };

  factory ShippingAddressModel.fromEntity(
    ShippingAddressEntity shippingAdressEntity,
  ) => ShippingAddressModel(
    address: shippingAdressEntity.adress,
    city: shippingAdressEntity.city,
    floor: shippingAdressEntity.floor,
    phoneNumber: shippingAdressEntity.phoneNumber,
    name: shippingAdressEntity.name,
    email: shippingAdressEntity.email,
  );
}
