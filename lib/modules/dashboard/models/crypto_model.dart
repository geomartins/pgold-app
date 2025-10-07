class CryptoModel {
  int? id;
  String? name;
  String? code;
  String? icon;
  List<Networks>? networks;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? isStable;
  String? color;
  String? minimumDeposit;
  int? maximumDecimalPlaces;
  bool? showBuy;
  String? buyRate;
  String? sellRate;
  String? usdRate;

  CryptoModel(
      {this.id,
      this.name,
      this.code,
      this.icon,
      this.networks,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.isStable,
      this.color,
      this.minimumDeposit,
      this.maximumDecimalPlaces,
      this.showBuy,
      this.buyRate,
      this.sellRate,
      this.usdRate});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    icon = json['icon'];
    if (json['networks'] != null) {
      networks = <Networks>[];
      json['networks'].forEach((v) {
        networks!.add(Networks.fromJson(v));
      });
    }
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isStable = json['is_stable'];
    color = json['color'];
    minimumDeposit = json['minimumDeposit'];
    maximumDecimalPlaces = json['maximumDecimalPlaces'];
    showBuy = json['show_buy'];
    buyRate = json['buy_rate'];
    sellRate = json['sell_rate'];
    usdRate = json['usd_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['icon'] = icon;
    if (networks != null) {
      data['networks'] = networks!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_stable'] = isStable;
    data['color'] = color;
    data['minimumDeposit'] = minimumDeposit;
    data['maximumDecimalPlaces'] = maximumDecimalPlaces;
    data['show_buy'] = showBuy;
    data['buy_rate'] = buyRate;
    data['sell_rate'] = sellRate;
    data['usd_rate'] = usdRate;
    return data;
  }
}

class Networks {
  int? id;
  String? addressRegex;
  // Null? memoRegex;
  String? name;
  String? code;
  String? fee;
  String? feeType;
  String? minimum;
  String? contractAddress;
  // Null? explorerLink;
  String? createdAt;
  String? updatedAt;

  Networks(
      {this.id,
      this.addressRegex,
      // this.memoRegex,
      this.name,
      this.code,
      this.fee,
      this.feeType,
      this.minimum,
      this.contractAddress,
      // this.explorerLink,
      this.createdAt,
      this.updatedAt});

  Networks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressRegex = json['addressRegex'];
    // memoRegex = json['memoRegex'];
    name = json['name'];
    code = json['code'];
    fee = json['fee'];
    feeType = json['feeType'];
    minimum = json['minimum'];
    contractAddress = json['contractAddress'];
    // explorerLink = json['explorerLink'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['addressRegex'] = addressRegex;
    // data['memoRegex'] = memoRegex;
    data['name'] = name;
    data['code'] = code;
    data['fee'] = fee;
    data['feeType'] = feeType;
    data['minimum'] = minimum;
    data['contractAddress'] = contractAddress;
    // data['explorerLink'] = explorerLink;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
