//Creamos una clase que nos guarde los nombres de los paises que nos trae el endpoint del provider
class CountriesCurrency{
  late Map<String,dynamic> countries;

  CountriesCurrency({
    required this.countries
  });

  factory CountriesCurrency.fromJsonMap(Map<String, dynamic> json){
    return CountriesCurrency(
      countries: json
    );
  }

}
