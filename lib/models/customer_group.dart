import 'package:flutter/material.dart';

import 'customer.dart';

class CustomerGroup {
  String id;
  String name;
  String description;
  String imgPicture;
  Color tags;
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
