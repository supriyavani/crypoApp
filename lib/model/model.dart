class CurrencyList {
  String id;
  String name;
  String logo_url;
  double price;
  CurrencyList({
    required this.id,
    required this.name,
    required this.logo_url,
    required this.price,
  });

  factory CurrencyList.fromJson(Map<String, dynamic> json) {
    return CurrencyList(
      id: json['id'],
      name: json['name'],
      logo_url: json['logo_url'],
      price: double.parse(json['price']),
    );
  }
}
