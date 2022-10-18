import 'package:flutter/material.dart';

class Mydropdown extends StatelessWidget {
  const Mydropdown({Key? key, required this.items, required this.onChanged}) : super(key: key);
  final List<String> items;
  final void Function(String?) onChanged;
  

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Select a currency',
        labelText: 'Currency',
      ),
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}