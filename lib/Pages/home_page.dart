import 'package:currency_api/Models/countries_model.dart';
import 'package:currency_api/Provider/currency_provider.dart';
import 'package:currency_api/Widgets/my_dropdown.dart';
import 'package:currency_api/Widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerFrom = TextEditingController();
  final TextEditingController _controllerTo = TextEditingController();

  String _currencyFrom = 'USD';
  String _currencyTo = 'USD';

  double _amount = 1;
  double _result = 0.0;

  final CurrencyProvider _currencyProvider = CurrencyProvider();

  late Future<CountriesCurrency> _countries;

  @override
  void initState() {
    super.initState();
    _countries = _currencyProvider.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<CountriesCurrency>(
          future: _countries,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Text(
                  '$_amount ${snapshot.data!.countries[_currencyFrom]} is equal to',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 10),
                Text(
                  '$_result ${snapshot.data!.countries[_currencyTo]}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomField(
                controller: _controllerFrom,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Mydropdown(
                items: ['USD', 'EUR', 'GBP', 'CAD', 'AUD', 'JPY', 'CNY'],
                onChanged: (String? value) {
                  setState(() {
                    _currencyFrom = value!;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: CustomField(
                controller: _controllerTo,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Mydropdown(
                items: ['USD', 'EUR', 'GBP', 'CAD', 'AUD', 'JPY', 'CNY'],
                onChanged: (String? value) {
                  setState(() {
                    _currencyTo = value!;
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
