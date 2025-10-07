import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:pgold/utils/keyboard_util.dart';
import '../../../config/enumefy.dart';
import '../../../utils/flex_util.dart';
import '../../../utils/notification_util.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../dashboard/screens/dashboard.dart';
import '../controllers/register_controller.dart';

class EmailAddressFormWidget extends GetView<RegisterController>
    with KeyboardUtil {
  const EmailAddressFormWidget({super.key});

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
                currentStep: 3,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormField(context),
                  _buildNextField(context),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildNextField(BuildContext context) {
    return Column(
      children: [
        Obx(() => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              child: ElevatedButton(
                onPressed: controller.canSubmitForm(['email'])
                    ? () async {
                        try {
                          removeFocus();
                          FlexUtil.showLoadingOverlay(context);
                          await controller.submit();
                          Get.offAllNamed(Dashboard.id);
                        } catch (e) {
                          NotificationUtil()
                              .showErrorSnackbar("Oops!!", e.toString());
                        } finally {
                          FlexUtil.hideLoadingOverlay();
                        }
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
          'Email Address',
          style:
              TextStyle(fontSize: 30, fontWeight: FontWeight.w600, height: 1.5),
        ),
        Text(
          'Make sure you enter your details correctly!',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: HexColor('#718096')),
        ),
        const SizedBox(height: 20),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 5),
                TextField(
                  key: const ValueKey("email"),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.editor.email
                    ..text = controller.state.email.value,
                  onChanged: (value) {
                    controller.updateEmail(value);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 10), // Adjust spacing
                        child: SvgPicture.asset(
                          'assets/images/email-icon.svg',
                        ),
                      ),
                      labelText: 'name@example.com',
                      labelStyle: TextStyle(
                          fontSize: 16,
                          color: Palletefy()
                              .v3LabelColor(ThemeModeType.systemMode)),
                      errorText: controller.getErrorText('email')),
                ),
              ],
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}
