import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Custom_Checkbox extends StatefulWidget {
  double? size;
  double? iconSize;
  Function onChange;
  Color backgroundColor;
  Color? iconColor;
  IconData? icon;
  bool isChecked;

  Custom_Checkbox({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    required this.backgroundColor,
    this.iconColor,
    this.icon,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<Custom_Checkbox> createState() => _Custom_CheckboxState();
}

// ignore: camel_case_types
class _Custom_CheckboxState extends State<Custom_Checkbox> {
  bool isChecked = false;
  Color? cbColor;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange(isChecked, widget.backgroundColor);
        });
      },
      child: AnimatedContainer(
          height: widget.size ?? 28,
          width: widget.size ?? 28,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: widget.backgroundColor,
            // isChecked ? widget.backgroundColor ?? Colors.blue : Colors.red,
          ),
          child: isChecked
              ? Icon(
                  widget.icon ?? Icons.check,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 20,
                )
              : null),
    );
  }
}
