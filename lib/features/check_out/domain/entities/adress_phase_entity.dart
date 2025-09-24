class ShippingAdressEntity {
  String? name;
  String? emial;
  String? phoneNumber;
  String? city;
  String? adress;
  String? floor;

  ShippingAdressEntity({
    this.name,
    this.emial,
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
