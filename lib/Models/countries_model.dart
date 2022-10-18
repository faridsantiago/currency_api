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
