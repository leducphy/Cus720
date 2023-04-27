import 'customer.dart';

class CustomerGroup {
  String id;
  String name;
  String description;
  String imgPicture;
  List<String> tags;
  List<Customer> customers;

  CustomerGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.imgPicture,
    required this.tags,
    required this.customers,
  });
}
