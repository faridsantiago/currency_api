import 'package:flutter/material.dart';

class Mydropdown extends StatelessWidget {
  const Mydropdown({Key? key, required this.items, required this.onChanged, required this.value}) : super(key: key);
  final List<String> items;
  final void Function(String?) onChanged;
  final String value;
  

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        icon: const Icon(Icons.monetization_on),
        
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