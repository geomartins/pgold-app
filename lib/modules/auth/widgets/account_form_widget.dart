import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:matertino_radio/matertino_radio.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:pgold/modules/auth/widgets/email_address_form_widget.dart';
import 'package:pgold/utils/keyboard_util.dart';
import '../../../config/enumefy.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/app_bar_widget.dart';
import '../controllers/register_controller.dart';

class AccountFormWidget extends GetView<RegisterController> with KeyboardUtil {
  const AccountFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          appBar: AppBarWidget(
            titleWidget: SizedBox(
              height: 6,
              child: LinearProgressBar(
                borderRadius: BorderRadius.circular(100),
                minHeight: 10,
                maxSteps: 6,
                progressType:
                    LinearProgressBar.progressTypeLinear, // Use Dots progress
                currentStep: 2,
                progressColor:
                    Palletefy().primaryColor(ThemeModeType.systemMode),
                backgroundColor: HexColor('#E9EAEC'),
              ),
            ),
            title: '',
          ),
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormField(context),
                    _buildNextField(context),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildNextField(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Obx(() => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              child: ElevatedButton(
                onPressed: controller.canSubmitForm([
                  'fullname',
                  'password',
                  'password_confirmation',
                  // 'phone'
                ])
                    ? () async {
                        removeFocus();
                        Get.to(() => const EmailAddressFormWidget());
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Palletefy().primaryColor(ThemeModeType.systemMode),
                  disabledForegroundColor: Palletefy()
                      .primaryColor(ThemeModeType.systemMode)
                      .withOpacity(0.38),
                  disabledBackgroundColor: Palletefy()
                      .primaryColor(ThemeModeType.systemMode)
                      .withOpacity(0.12),
                ),
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.bodySmall!.merge(
                        TextStyle(
                            color:
                                Palletefy().textColor(ThemeModeType.darkMode),
                            fontSize: 14),
                      ),
                ),
              ),
            )),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildFormField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create account',
          style:
              TextStyle(fontSize: 30, fontWeight: FontWeight.w600, height: 1.5),
        ),
        Text(
          'Create your PGOLD account to get started in minutes!',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: HexColor('#718096')),
        ),

        //FULLNAME
        const SizedBox(height: 20),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fullname',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 5),
                TextField(
                  key: const ValueKey("fullname"),
                  textInputAction: TextInputAction.done,
                  controller: controller.editor.fullName
                    ..text = controller.state.fullName.value,
                  onChanged: (value) {
                    controller.updateFullName(value);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 10), // Adjust spacing
                        child: SvgPicture.asset(
                          'assets/images/person-icon.svg',
                        ),
                      ),
                      hintText: 'Enter Full Name',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Palletefy()
                              .v3LabelColor(ThemeModeType.systemMode)),
                      errorText: controller.getErrorText('fullname')),
                ),
              ],
            )),

        //PHONE NUMBER
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone Number',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
            ),
            const SizedBox(height: 5),
            IntlPhoneField(
              controller: controller.editor.phone,
              dropdownDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.zero, shape: BoxShape.circle),
              decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(),
                  ),
                  errorText: controller.getErrorText('phone')),
              initialCountryCode: 'NG',
              onChanged: (phone) {
                controller.updatePhone(
                    phone: phone.number,
                    countryCode: phone.countryCode,
                    countryISOCode: phone.countryISOCode);
                debugPrint(phone.completeNumber);
                debugPrint(phone.number);
                debugPrint(phone.countryCode);
                debugPrint(phone.countryISOCode);
              },
            )
          ],
        ),

        //REFERRAL
        const SizedBox(height: 20),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Referral',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 5),
                TextField(
                  key: const ValueKey("referral"),
                  textInputAction: TextInputAction.done,
                  controller: controller.editor.referral
                    ..text = controller.state.referral.value,
                  onChanged: (value) {
                    controller.updateReferral(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10), // Adjust spacing
                      child: SvgPicture.asset(
                        'assets/images/multi-user-icon.svg',
                      ),
                    ),
                    labelText: 'Referral code  (Optional)',
                    labelStyle: TextStyle(
                        fontSize: 15,
                        color:
                            Palletefy().v3LabelColor(ThemeModeType.systemMode)),
                  ),
                ),
              ],
            )),

        //HOW DID YOU HEAR ABOUT US
        const SizedBox(height: 20),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'How did you  hear about us (Optional)',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 5),
                MatertinoBottomSheetRadio(
                    tileColor: Colors.transparent,
                    list: const [
                      "Referral",
                      "Social Media",
                      "Website",
                      "Ad",
                      "Instagram",
                      "Newspaper"
                    ],
                    selected: controller.state.referralSource.value,
                    onSelect: (val) {
                      controller.updateReferralSource(val);
                    },
                    child: CupertinoTextField(
                      controller: controller.editor.referralSource
                        ..text = controller.state.referralSource.value,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Palletefy()
                              .textFieldFillColor(ThemeModeType.systemMode),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: HexColor('#E0E9FC'))),
                      onTap: null,
                      // controller: TextEditingController(text: selectedItem),
                      placeholder: "How did you hear about us",

                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          color: Palletefy()
                              .v3LabelColor(ThemeModeType.systemMode)),
                      enabled: true,
                      suffix: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ))
              ],
            )),

        //PASSWORD
        const SizedBox(height: 20),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 5),
                TextField(
                  key: const ValueKey("password"),
                  textInputAction: TextInputAction.done,
                  controller: controller.editor.password,
                  onChanged: (value) {
                    controller.updatePassword(value);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 10), // Adjust spacing
                        child: SvgPicture.asset(
                          'assets/images/password-icon.svg',
                        ),
                      ),
                      hintText: 'Re-type Password',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Palletefy()
                              .v3LabelColor(ThemeModeType.systemMode)),
                      errorText: controller.getErrorText('password')),
                ),
              ],
            )),

        //CONFIRM PASSWORD
        const SizedBox(height: 20),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 5),
                TextField(
                  key: const ValueKey("password_confirmation"),
                  textInputAction: TextInputAction.done,
                  controller: controller.editor.passwordConfirmation,
                  onChanged: (value) {
                    controller.updatePasswordConfirmation(value);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 10), // Adjust spacing
                        child: SvgPicture.asset(
                          'assets/images/password-icon.svg',
                        ),
                      ),
                      hintText: 'Re-type Password',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Palletefy()
                              .v3LabelColor(ThemeModeType.systemMode)),
                      errorText:
                          controller.getErrorText('password_confirmation')),
                ),
              ],
            )),
      ],
    );
  }
}
