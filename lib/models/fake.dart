import 'package:myapp/models/customer.dart';
import 'package:myapp/models/customer_group.dart';

class DataFake {
  static List<Customer> customers = [
    Customer(
      id: '1',
      name: 'Aohn Doe',
      phone: '555-1234',
      imgPicture: 'https://example.com/john.jpg',
    ),
    Customer(
      id: '2',
      name: 'Aane Smith',
      phone: '555-5678',
      imgPicture: 'https://example.com/jane.jpg',
    ),
    Customer(
      id: '3',
      name: 'Bob Johnson',
      phone: '555-9012',
      imgPicture: 'https://example.com/bob.jpg',
    ),
    Customer(
      id: '4',
      name: 'Alice Brown',
      phone: '555-3456',
      imgPicture: 'https://example.com/alice.jpg',
    ),
    Customer(
      id: '5',
      name: 'Sam Williams',
      phone: '555-7890',
      imgPicture: 'https://example.com/sam.jpg',
    ),
    Customer(
      id: '6',
      name: 'Samantha Davis',
      phone: '555-2345',
      imgPicture: 'https://example.com/samantha.jpg',
    ),
    Customer(
      id: '7',
      name: 'Mark Wilson',
      phone: '555-6789',
      imgPicture: 'https://example.com/mark.jpg',
    ),
    Customer(
      id: '8',
      name: 'Emily Taylor',
      phone: '555-0123',
      imgPicture: 'https://example.com/emily.jpg',
    ),
    Customer(
      id: '9',
      name: 'David Martin',
      phone: '555-4567',
      imgPicture: 'https://example.com/david.jpg',
    ),
    Customer(
      id: '10',
      name: 'Aaura Thompson 10',
      phone: '555-8901',
      imgPicture: 'https://example.com/laura.jpg',
    ),
  ];

  Set<String> firstLetters = {};
  List<String> names = customers.map((customer) => customer.name).toList();

  List<Customer> getdataCus() {
    return customers;
  }

  List<CustomerGroup> grps = [
    // add more customer groups here
  ];
  Map<String, dynamic> findMatchingCustomers() {
    Map<String, List<Customer>> map = {};
    for (var customer in customers) {
      String firstChar = customer.name.substring(0, 1).toUpperCase();
      if (map.containsKey(firstChar)) {
        map[firstChar]?.add(customer);
      } else {
        map[firstChar] = [customer];
      }
    }
    return map;
  }
}
