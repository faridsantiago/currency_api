// ignore_for_file: file_names, unused_import, camel_case_types, depend_on_referenced_packages
import 'dart:convert';
import 'package:currency_api/Models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/Currency_model.dart';


class CurrencyProvider{
  final _url ="https://api.frankfurter.app/latest";

  Future<Modelcurrency> getCurrency() async{
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200){
      final data = json.decode(response.body);
      final latest = Modelcurrency.fromJsonMap(data);//creamos una variable latest para almacenar los datos del json
      return latest;//retornamos los datos del json
      
    }else{
      throw Exception('Failed to load data');
    }
  }
  Future<Modelcurrency> getConvertCurrencies(double amount, String currency1, String currency2) async {
    final String url2 = "https://api.frankfurter.app/latest?amount=$amount&from=$currency1&to=$currency2";
    final response = await http.get(Uri.parse(url2));
    final decodedData = json.decode(response.body);
    final currencies = Modelcurrency.fromJsonMap(decodedData);
    return currencies;
  }
  Future<CountriesCurrency> getCountries() async{
    
    final String url3 = "https://api.frankfurter.app/currencies";
    final response = await http.get(Uri.parse(url3));
    String body = utf8.decode(response.bodyBytes);
    final decodedData = json.decode(body);
    print("Llegue aqui a getCountries");
    final countries = CountriesCurrency.fromJsonMap(decodedData);
    return countries;

  }

  
}