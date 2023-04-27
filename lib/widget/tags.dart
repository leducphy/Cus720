import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TagsWidget extends StatefulWidget {
  final Function? onSelected;
  final List<String> xtags;

  const TagsWidget({super.key, this.onSelected, required this.xtags});

  @override
  _TagsWidgetState createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  final TextEditingController _controller = TextEditingController();

  static const List<String> listTags = <String>[
    'Youtube',
    'Facebook',
    'Zalo',
    'Instargram',
    'Messeger',
    'Le Duc Phi',
    'TypeAheadField',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/icons/tags.svg',
              ),
              const Positioned(
                top: 6,
                left: 8,
                child: Text(
                  'Tag',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Wrap(
          spacing: 8,
          children: _buildTagChips(),
        ),
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Thêm tag',
              labelStyle: TextStyle(fontSize: 14),
            ),
          ),
          suggestionsCallback: (pattern) {
            return listTags
                .where(
                    (tag) => tag.toLowerCase().contains(pattern.toLowerCase()))
                .toList();
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.toString()),
            );
          },
          onSuggestionSelected: (suggestion) {
            widget.onSelected?.call(suggestion);
            _controller.clear();
            // setState(() {
            //   widget.xtags.add(suggestion.toString());
            // });
          },
        ),
      ],
    );
  }

  List<Widget> _buildTagChips() {
    return widget.xtags.map((tag) {
      return Chip(
        backgroundColor: const Color(0xffE6EDFA),
        label: Text(
          tag,
          style: const TextStyle(color: Color(0xff4051B4)),
        ),
        onDeleted: () {
          setState(() {
            widget.xtags.remove(tag);
          });
        },
      );
    }).toList();
  }
}
