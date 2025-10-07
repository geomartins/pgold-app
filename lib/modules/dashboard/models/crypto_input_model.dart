class CryptoInputModel {
  String name;
  String action;
  double value;

  CryptoInputModel({
    required this.name,
    required this.action,
    required this.value,
  });

  // Optional: factory constructor to create from a map
  factory CryptoInputModel.fromJson(Map<String, dynamic> json) {
    return CryptoInputModel(
      name: json['name'] ?? '',
      action: json['action'] ?? '',
      value: (json['value'] ?? 0).toDouble(),
    );
  }

  // Optional: convert to map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'action': action,
      'value': value,
    };
  }
}
