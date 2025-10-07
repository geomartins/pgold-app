class GiftCardInputModel {
  String name;
  String country;
  String range;
  String category;
  String action;
  double value;

  GiftCardInputModel({
    required this.name,
    required this.country,
    required this.range,
    required this.category,
    required this.action,
    required this.value,
  });

  // Optional: factory constructor to create from a map (e.g., from API or local storage)
  factory GiftCardInputModel.fromJson(Map<String, dynamic> json) {
    return GiftCardInputModel(
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      range: json['range'] ?? '',
      category: json['category'] ?? '',
      action: json['action'] ?? '',
      value: (json['value'] ?? 0).toDouble(),
    );
  }

  // Optional: convert to map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'range': range,
      'category': category,
      'action': action,
      'value': value,
    };
  }
}
