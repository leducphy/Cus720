import 'package:flutter/material.dart';
import 'package:myapp/models/customer.dart';

class CardCustomer extends StatefulWidget {
  final Customer customer;
  final Function? onSelected;
  final List<Customer> customers;
  const CardCustomer(
      {super.key,
      required this.customer,
      this.onSelected,
      required this.customers});

  @override
  State<CardCustomer> createState() => _CardCustomerState();
}

class _CardCustomerState extends State<CardCustomer> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
              widget.onSelected?.call(widget.customer);
            },
            activeColor: const Color(0xff4051B4),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 55,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xffBDBFCB)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.account_circle,
                    color: Color(0xff5D6BB8),
                    size: 50,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.customer.name,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff102B4B)),
                      ),
                      Text(
                        widget.customer.phone,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onSelected?.call(widget.customer);
      },
    );
  }
}
