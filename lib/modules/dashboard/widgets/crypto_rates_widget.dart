import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:matertino_radio/matertino_radio.dart';
import 'package:pgold/modules/dashboard/controllers/rates_controller.dart';

import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';

class CryptoRatesWidget extends StatelessWidget {
  final RatesController controller;
  const CryptoRatesWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //CRPTO
          Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Crypto',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                  ),
                  const SizedBox(height: 5),
                  MatertinoBottomSheetRadio(
                      tileColor: Colors.transparent,
                      list: controller.queryCryptoName,
                      selected: controller.state.cryptoInput.value.name,
                      onSelect: (val) {
                        controller.updateCryptoInputName(val);
                      },
                      child: CupertinoTextField(
                        controller: TextEditingController(
                            text: controller.state.cryptoInput.value.name),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Palletefy()
                                .textFieldFillColor(ThemeModeType.systemMode),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: HexColor('#E0E9FC'))),
                        onTap: null,
                        placeholder: "Choose Crypto",
                        placeholderStyle: TextStyle(
                            fontSize: 15,
                            color: Palletefy()
                                .v3LabelColor(ThemeModeType.systemMode)),
                        enabled: false,
                        suffix: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ))
                ],
              )),

          //CRPTO ACTION
          Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Crypto Action',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                  ),
                  const SizedBox(height: 5),
                  MatertinoBottomSheetRadio(
                      tileColor: Colors.transparent,
                      list: controller.queryCryptoAction,
                      selected: controller.state.cryptoInput.value.action,
                      onSelect: (val) {
                        controller.updateCryptoInputAction(val);
                      },
                      child: CupertinoTextField(
                        controller: TextEditingController(
                            text: controller.state.cryptoInput.value.action),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Palletefy()
                                .textFieldFillColor(ThemeModeType.systemMode),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: HexColor('#E0E9FC'))),
                        onTap: null,
                        placeholder: "Select Crypto Action",
                        placeholderStyle: TextStyle(
                            fontSize: 15,
                            color: Palletefy()
                                .v3LabelColor(ThemeModeType.systemMode)),
                        enabled: false,
                        suffix: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ))
                ],
              )),

          //Crypto Value ($USD)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Crypto Value (USD)",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
              ),
              const SizedBox(height: 5),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  double parsedValue = double.tryParse(value) ?? 0;
                  controller.updateCryptoInputValue(parsedValue);
                },
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Palletefy()
                          .textFieldBorderColor(ThemeModeType.lightMode),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Palletefy()
                          .textFieldBorderColor(ThemeModeType.lightMode),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Palletefy()
                          .textFieldBorderColor(ThemeModeType.lightMode),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Enter Card Value',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Palletefy().v3LabelColor(ThemeModeType.systemMode),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 30),
          Container(
            width: Get.width,
            height: 130,
            decoration: BoxDecoration(color: HexColor('#FFFFFF')),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Rate',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#718096')),
                  ),
                  trailing: Text(
                    '0',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#718096')),
                  ),
                ),
                const Divider(
                  thickness: .5,
                ),
                ListTile(
                  title: Text(
                    'Total Value',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#718096')),
                  ),
                  trailing: Text(
                    '0 NGN',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#718096')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  'assets/images/info-circle-icon.svg',
                ),
              ),
              Text(
                'This is an estimated rate. Actual rate may differ.',
                style: TextStyle(fontSize: 13, color: HexColor('#718096')),
              )
            ],
          )
        ],
      ),
    );
  }
}
