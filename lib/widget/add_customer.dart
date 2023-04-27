import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:myapp/models/fake.dart';

class AddCustomers extends StatefulWidget {
  const AddCustomers({super.key});

  @override
  _AddCustomersState createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {
  final List<String> _customers = [];
  DataFake dataFake = DataFake();

  final TextEditingController _controller = TextEditingController();

  static List<String> listcustomers =
      DataFake().getdataCus().map((e) => e.name).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: _buildTagChips(),
        ),
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _controller,
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
          ),
          suggestionsCallback: (pattern) async {
            return listcustomers
                .where(
                    (tag) => tag.toLowerCase().contains(pattern.toLowerCase()))
                .toList();
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          onSuggestionSelected: (suggestion) {
            _controller.clear();
            if (!_customers.contains(suggestion)) {
              setState(() {
                _customers.add(suggestion);
              });
            }
          },
        ),
      ],
    );
  }

  List<Widget> _buildTagChips() {
    return _customers.map((tag) {
      return Chip(
        backgroundColor: const Color(0xffE6EDFA),
        label: Text(
          tag,
          style: const TextStyle(color: Color(0xff4051B4)),
        ),
        onDeleted: () {
          setState(() {
            _customers.remove(tag);
          });
        },
      );
    }).toList();
  }
}
