import '../Pages/home_page.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 14, 93, 241),
        appBar: AppBar(
          title: const Text('Currency Converter'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent[400],
        ),
        body: const Padding(

          padding:  EdgeInsets.all(40.0),
          child:  HomePage(),
        ),
      ),
    );
  }
}