class GiftCardModel {
  int? id;
  String? title;
  String? image;
  String? brandLogo;
  String? status;
  String? createdAt;
  int? confirmMin;
  int? confirmMax;
  List<Countries>? countries;

  GiftCardModel(
      {this.id,
      this.title,
      this.image,
      this.brandLogo,
      this.status,
      this.createdAt,
      this.confirmMin,
      this.confirmMax,
      this.countries});

  GiftCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    brandLogo = json['brand_logo'];
    status = json['status'];
    createdAt = json['created_at'];
    confirmMin = json['confirm_min'];
    confirmMax = json['confirm_max'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['brand_logo'] = brandLogo;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['confirm_min'] = confirmMin;
    data['confirm_max'] = confirmMax;
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  int? id;
  String? status;
  String? name;
  String? image;
  String? iso;
  Currency? currency;
  List<Ranges>? ranges;

  Countries(
      {this.id,
      this.status,
      this.name,
      this.image,
      this.iso,
      this.currency,
      this.ranges});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    image = json['image'];
    iso = json['iso'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    if (json['ranges'] != null) {
      ranges = <Ranges>[];
      json['ranges'].forEach((v) {
        ranges!.add(Ranges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['name'] = name;
    data['image'] = image;
    data['iso'] = iso;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (ranges != null) {
      data['ranges'] = ranges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Currency {
  int? id;
  String? name;
  String? symbol;
  String? symbolNative;
  int? decimalDigits;
  int? rounding;
  String? code;
  String? namePlural;
  String? createdAt;
  String? updatedAt;

  Currency(
      {this.id,
      this.name,
      this.symbol,
      this.symbolNative,
      this.decimalDigits,
      this.rounding,
      this.code,
      this.namePlural,
      this.createdAt,
      this.updatedAt});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    symbolNative = json['symbolNative'];
    decimalDigits = json['decimalDigits'];
    rounding = json['rounding'];
    code = json['code'];
    namePlural = json['namePlural'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['symbolNative'] = symbolNative;
    data['decimalDigits'] = decimalDigits;
    data['rounding'] = rounding;
    data['code'] = code;
    data['namePlural'] = namePlural;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Ranges {
  int? id;
  String? giftCardId;
  String? giftCardCountryId;
  String? status;
  String? min;
  String? max;
  String? updatedBy;
  List<ReceiptCategories>? receiptCategories;

  Ranges(
      {this.id,
      this.giftCardId,
      this.giftCardCountryId,
      this.status,
      this.min,
      this.max,
      this.updatedBy,
      this.receiptCategories});

  Ranges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    giftCardId = json['gift_card_id'];
    giftCardCountryId = json['gift_card_country_id'];
    status = json['status'];
    min = json['min'];
    max = json['max'];
    updatedBy = json['updated_by'];
    if (json['receipt_categories'] != null) {
      receiptCategories = <ReceiptCategories>[];
      json['receipt_categories'].forEach((v) {
        receiptCategories!.add(ReceiptCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gift_card_id'] = giftCardId;
    data['gift_card_country_id'] = giftCardCountryId;
    data['status'] = status;
    data['min'] = min;
    data['max'] = max;
    data['updated_by'] = updatedBy;
    if (receiptCategories != null) {
      data['receipt_categories'] =
          receiptCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReceiptCategories {
  int? id;
  String? updatedBy;
  String? status;
  String? title;
  String? amount;
  String? rangeId;
  String? giftCardCountryId;
  String? giftCardId;

  ReceiptCategories(
      {this.id,
      this.updatedBy,
      this.status,
      this.title,
      this.amount,
      this.rangeId,
      this.giftCardCountryId,
      this.giftCardId});

  ReceiptCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedBy = json['updated_by'];
    status = json['status'];
    title = json['title'];
    amount = json['amount'];
    rangeId = json['range_id'];
    giftCardCountryId = json['gift_card_country_id'];
    giftCardId = json['gift_card_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['updated_by'] = updatedBy;
    data['status'] = status;
    data['title'] = title;
    data['amount'] = amount;
    data['range_id'] = rangeId;
    data['gift_card_country_id'] = giftCardCountryId;
    data['gift_card_id'] = giftCardId;
    return data;
  }
}
