import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pgold/modules/dashboard/models/crypto_input_model.dart';
import 'package:pgold/modules/dashboard/models/gift_card_model.dart';
import 'package:pgold/modules/dashboard/services/rates_service.dart';
import 'package:pgold/utils/validator_ext_util.dart';
import '../editors/rates_editor.dart';
import '../models/crypto_model.dart';
import '../models/gift_card_input_model.dart';
import '../states/rates_state.dart';

class RatesController extends GetxController with ValidatorExtUtil {
  static RatesController get to => Get.put<RatesController>(RatesController());
  final state = RatesState();
  final editor = RatesEditor();

  @override
  void onInit() {
    super.onInit();
    fetchGiftCards();
    fetchCryptos();

    ever(state.giftCardInput, (GiftCardInputModel? input) {
      debugPrint("I noticed a change here in giftcard");
    });
    ever(state.cryptoInput, (CryptoInputModel? input) {
      debugPrint("I noticed a change here in crypto");
    });
  }

  List get queryCryptoName {
    return state.cryptos.map((e) => e.name).toList();
  }

  List get queryCryptoAction {
    return ["Sell Crypto", "Buy Crypto"];
  }

  ///================ GiftCard Query Starts Here
  List get queryGiftCardName {
    return state.giftCards.map((e) => e.title).toList();
  }

  List get queryGiftCardCountry {
    return state.giftCards
        .where((giftCard) => giftCard.title == state.giftCardInput.value.name)
        .expand((giftCard) => giftCard.countries ?? [])
        .map((country) => country.name)
        .whereType<String>() // ensures null-safety
        .toList();
  }

  List get queryGiftCardRange {
    return (state.giftCards
            .firstWhere(
              (gc) => gc.title == state.giftCardInput.value.name,
              orElse: () => GiftCardModel(countries: []),
            )
            .countries
            ?.firstWhere(
              (country) => country.name == state.giftCardInput.value.country,
              orElse: () =>
                  Countries(ranges: [], currency: Currency(symbol: '')),
            )
            .ranges
            ?.map((range) {
          final symbol = state.giftCards
                  .firstWhere(
                    (gc) => gc.title == state.giftCardInput.value.name,
                    orElse: () => GiftCardModel(countries: []),
                  )
                  .countries
                  ?.firstWhere(
                    (country) =>
                        country.name == state.giftCardInput.value.country,
                    orElse: () => Countries(currency: Currency(symbol: '')),
                  )
                  .currency
                  ?.symbol ??
              '';
          return '$symbol${range.min} - $symbol${range.max}';
        }).toList()) ??
        [];
  }

  List get queryGiftCardCategory {
    return ((state.giftCards
            .firstWhere(
              (gc) => gc.title == state.giftCardInput.value.name,
              orElse: () => GiftCardModel(countries: []),
            )
            .countries
            ?.firstWhere(
              (country) => country.name == state.giftCardInput.value.country,
              orElse: () => Countries(ranges: []),
            )
            .ranges
            ?.expand((range) => range.receiptCategories ?? [])
            .map((rc) => rc.title ?? '')
            .whereType<String>()
            .toSet() // removes duplicates
            .toList()) ??
        []);
  }

  List get queryGiftCardAction {
    return ["Sell Giftcard", "Buy Giftcard"];
  }

  ///================ GiftCard Query ends Here

  // ================= Crypto Input Updates Starts here =================
  void updateCryptoInputName(String val) => state.cryptoInput.update((m) {
        if (m != null) m.name = val;
      });

  void updateCryptoInputAction(String val) => state.cryptoInput.update((m) {
        if (m != null) m.action = val;
      });

  void updateCryptoInputValue(double val) => state.cryptoInput.update((m) {
        if (m != null) m.value = val;
      });
  // ================= Crypto Input Updates ends here =================

  // ================= Gift Card Input Updates Starts here =================
  void updateGiftCardInputName(String val) => state.giftCardInput.update((m) {
        if (m != null) m.name = val;
      });

  void updateGiftCardInputCountry(String val) =>
      state.giftCardInput.update((m) {
        if (m != null) m.country = val;
      });

  void updateGiftCardInputRange(String val) => state.giftCardInput.update((m) {
        if (m != null) m.range = val;
      });

  void updateGiftCardInputCategory(String val) =>
      state.giftCardInput.update((m) {
        if (m != null) m.category = val;
      });

  void updateGiftCardInputAction(String val) => state.giftCardInput.update((m) {
        if (m != null) m.action = val;
      });

  void updateGiftCardInputValue(double val) => state.giftCardInput.update((m) {
        if (m != null) m.value = val;
      });

  // ================= Gift Card Input Updates Starts ends here =================

  Future<void> fetchGiftCards({
    int maxRetries = 20,
    int retryDelaySeconds = 3,
  }) async {
    int attempts = 0;

    while (state.giftCards.isEmpty && attempts < maxRetries) {
      attempts++;
      try {
        if (state.giftCards.isEmpty) {}

        final response = await RatesService().getGiftCards();
        final List<dynamic> giftCardMap = response.data['data'];
        final giftCards =
            giftCardMap.map((x) => GiftCardModel.fromJson(x)).toList();

        if (giftCards.isNotEmpty) {
          state.giftCards.assignAll(giftCards);
          break;
        }
      } catch (e) {
        debugPrint("Attempt $attempts failed: $e");
        if (attempts < maxRetries) {
          await Future.delayed(Duration(seconds: retryDelaySeconds));
        }
      } finally {}
    }
  }

  Future<void> fetchCryptos({
    int maxRetries = 20,
    int retryDelaySeconds = 3,
  }) async {
    int attempts = 0;

    while (state.cryptos.isEmpty && attempts < maxRetries) {
      attempts++;
      try {
        if (state.cryptos.isEmpty) {}

        final response = await RatesService().getCryptos();
        final List<dynamic> cryptoMap = response.data['data'];
        final cryptos = cryptoMap.map((x) => CryptoModel.fromJson(x)).toList();

        if (cryptos.isNotEmpty) {
          state.cryptos.assignAll(cryptos);
          debugPrint(
              "Cryptos fetched successfully after $attempts attempt(s).");
          break;
        }
      } catch (e) {
        debugPrint("Attempt $attempts failed: $e");
        if (attempts < maxRetries) {
          await Future.delayed(Duration(seconds: retryDelaySeconds));
        }
      } finally {}
    }
  }
}
