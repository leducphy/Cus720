import 'package:flutter/material.dart';
import 'package:myapp/models/customer.dart';
import 'package:myapp/models/fake.dart';
import 'package:myapp/widget/card_customer.dart';

class ShowContact extends StatefulWidget {
  const ShowContact({
    super.key,
  });

  @override
  State<ShowContact> createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContact> {
  bool isChecked = false;
  final List<Customer> _customers = [];

  Map<String, dynamic> customersByAlphabet = DataFake().findMatchingCustomers();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.001),
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (_, controller) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 23),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 55),
                                    child: Text(
                                      'Thêm khách hàng',
                                      style: TextStyle(
                                        color: Color(0xff4C568E),
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context, _customers);
                                },
                                icon: const Icon(
                                  Icons.save,
                                  size: 30,
                                  color: Color(0xff4C568E),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 30, left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffE7EDF9),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(Icons.search),
                        hintStyle: const TextStyle(
                          color: Color(0xff9D9EA0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        hintText: 'Tìm kiếm khách hàng',
                      )),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: customersByAlphabet.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = customersByAlphabet.keys.elementAt(index);
                        List<Customer> customers = customersByAlphabet[key];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: double.infinity,
                              color: const Color(0xffE6ECF6),
                              child: _firstChar(key),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: customers.length,
                              itemBuilder: (BuildContext context, int index) {
                                Customer customer = customers[index];
                                return CardCustomer(
                                  customer: customer,
                                  customers: _customers,
                                  onSelected: (x) {
                                    if (_customers.contains(x)) {
                                      _customers.remove(x);
                                    } else {
                                      _customers.add(x);
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _firstChar(String x) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 30),
      child: Text(
        x,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(180, 92, 106, 122),
        ),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffE7EDF9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        prefixIcon: const Icon(Icons.search),
        hintStyle: const TextStyle(
          color: Color(0xff9D9EA0),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        hintText: 'Tìm kiếm khách hàng',
      ),
    );
  }
}
