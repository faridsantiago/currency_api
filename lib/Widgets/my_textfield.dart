
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.controller, required this.onChanged});

  final TextEditingController controller;
  final void Function(String) onChanged;
  
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: const Icon(Icons.attach_money_sharp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Enter a number',
        labelText: 'Amount',
      ),
    );
  }
}