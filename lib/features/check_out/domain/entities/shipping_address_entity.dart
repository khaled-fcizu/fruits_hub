class ShippingAddressEntity {
  String? name;
  String? email;
  String? phoneNumber;
  String? city;
  String? adress;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.phoneNumber,
    this.city,
    this.adress,
    this.floor,
  });

  @override
  String toString() {
    return '$city, $adress, $floor';
  }
}
