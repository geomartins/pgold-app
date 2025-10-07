import 'package:get/get.dart';
import 'package:pgold/modules/dashboard/models/gift_card_model.dart';

import '../models/crypto_input_model.dart';
import '../models/crypto_model.dart';
import '../models/gift_card_input_model.dart';

class RatesState {
  final giftCards = <GiftCardModel>[].obs;
  final cryptos = <CryptoModel>[].obs;
  final errorMessage = ''.obs;

  final giftCardInput = GiftCardInputModel(
    name: '',
    country: '',
    range: '',
    category: '',
    action: '',
    value: 0,
  ).obs;

  final cryptoInput = CryptoInputModel(
    name: '',
    action: '',
    value: 0,
  ).obs;
}
