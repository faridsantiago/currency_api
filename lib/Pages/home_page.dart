import 'package:currency_api/Models/countries_model.dart';
import 'package:currency_api/Models/currency_model.dart';
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
  final TextEditingController _controllerAmount = TextEditingController();

  String _currencyFrom = 'USD';
  String _currencyTo = 'EUR';

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
    return Container(
      color: Color.fromARGB(255, 247, 240, 236),
      padding: const EdgeInsets.all(30.0),

      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<CountriesCurrency>(
              future: _countries,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
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
                    controller: _controllerAmount,
                    onChanged: (value) {
                      handleChange(value);
                    },
                    
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FutureBuilder<CountriesCurrency>(
                      future: _countries,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return Column(
                          children: [
                            Mydropdown(
                              items: snapshot.data!.countries.keys.toList(),
                              value: _currencyFrom,
                              onChanged: (String? value) {
                                setState(() {
                                  _currencyFrom = value!;
                                });
                                handleDropdown(value);
                              },
                            ),
                            const SizedBox(height: 20),
                            Mydropdown(
                              items: snapshot.data!.countries.keys.toList(),
                              value: _currencyTo,
                              onChanged: (String? value) {
                                setState(() {
                                  _currencyTo = value!;
                                });
                                handleDropdown(value);
                              },
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  handleChange(String value) async {
    if (value.isEmpty) {
        _amount = 1;
    } else {
      _amount = double.parse(value);
    }

    final rates = await _currencyProvider.getConvertCurrencies(
        _amount, _currencyFrom, _currencyTo);

    setState(() {
      _amount = rates.amount;
      _result = rates.rates[_currencyTo];
    });
  }

  handleDropdown(String?  value) async {
    final rates = await _currencyProvider.getConvertCurrencies(
        _amount, _currencyFrom, _currencyTo);
    
    setState(() {
      _amount = rates.amount;
      _result = rates.rates[_currencyTo];
    });
  }
}
