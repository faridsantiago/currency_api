
//creamos el modelo de la clase de la moneda
class Modelcurrency{
  late double amount;
  late String base;
  late Map<String,dynamic> rates;

  Modelcurrency(
    {
      required this.amount,
      required this.base,
      required this.rates
    }
  );

  //llamamos al json con los datos que necesitamos
  factory Modelcurrency.fromJsonMap(Map<String, dynamic> json){
    return Modelcurrency(
      amount: json['amount'],
      base: json['base'],
      rates: json['rates']
    );
  }
  
}

