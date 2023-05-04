class Customer {
  String id;
  String name;
  String phone;
  String imgPicture;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.imgPicture,
  });

  @override
  String toString() {
    return 'Customer{id: $id, name: $name, phone: $phone, imgPicture: $imgPicture}\n';
  }
}
