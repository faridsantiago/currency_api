import 'package:flutter/material.dart';

class Mydropdown extends StatelessWidget {
  const Mydropdown({Key? key, required this.items, required this.onChanged, required this.value}) : super(key: key);
  final List<String> items;
  final void Function(String?) onChanged; //utilizams el onchanged para que se actualice el valor de la moneda
  final String value;
  

  @override
  Widget build(BuildContext context) {
    //creamos un dropdownbutton que nos permita elegir la moneda de origen y destino
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