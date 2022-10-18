
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.controller});
  final TextEditingController controller;
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Enter a number',
        labelText: 'Amount',
      ),
    );
  }
}