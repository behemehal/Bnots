import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    required this.color,
    required this.onChange,
    required this.borderColor,
  }) : super(key: key);
  final Color color;
  final Color borderColor;
  final Function onChange;

  @override
  _ColorPicker createState() => _ColorPicker();
}

class _ColorPicker extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          color: widget.borderColor,
          width: 1,
        ),
      ),
    );
  }
}
