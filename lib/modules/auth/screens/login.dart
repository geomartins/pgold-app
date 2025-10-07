import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:pgold/modules/auth/screens/register.dart';
import 'package:pgold/modules/dashboard/screens/dashboard.dart';
import 'package:pgold/utils/keyboard_util.dart';
import '../../../config/enumefy.dart';
import '../../../utils/flex_util.dart';
import '../../../utils/notification_util.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../controllers/login_controller.dart';

class Login extends GetView<LoginController> with KeyboardUtil {
  static const String id = "/login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: Get.width,
            height: MediaQuery.of(context).size.height - 100,
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
        Obx(() => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              child: ElevatedButton(
                onPressed: controller.canSubmitForm(['email', 'password'])
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
                          color: Palletefy().textColor(ThemeModeType.darkMode),
                          fontSize: 14,
                        ),
                      ),
                ),
              ),
            )),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: Divider(
                height: .5,
                color: HexColor('#E1E4EA'),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'or login with',
                  style: TextStyle(color: HexColor('#718096'), fontSize: 16),
                ),
              ),
              Expanded(
                child: Divider(
                  height: .5,
                  color: HexColor('#E1E4EA'),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 50,
              child: OutlinedButton.icon(
                  icon: SvgPicture.asset(
                    'assets/images/x-icon.svg',
                  ),
                  onPressed: () async {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Button background color
                    side: BorderSide(
                        color:
                            Palletefy().primaryColor(ThemeModeType.systemMode),
                        width: .8), // Bord
                    minimumSize: Size.zero, // remove minimum size constraints
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // shrink the hit area
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Padding inside the button
                  ),
                  label: const Text('')),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: OutlinedButton.icon(
                  icon: SvgPicture.asset(
                    'assets/images/apple-icon.svg',
                  ),
                  onPressed: () async {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Button background color
                    side: BorderSide(
                        color:
                            Palletefy().primaryColor(ThemeModeType.systemMode),
                        width: .8), // Bord
                    minimumSize: Size.zero, // remove minimum size constraints
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // shrink the hit area
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Padding inside the button
                  ),
                  label: const Text('')),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: OutlinedButton.icon(
                  icon: SvgPicture.asset(
                    'assets/images/google-icon.svg',
                  ),
                  onPressed: () async {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Button background color
                    side: BorderSide(
                        color:
                            Palletefy().primaryColor(ThemeModeType.systemMode),
                        width: .8), // Bord
                    minimumSize: Size.zero, // remove minimum size constraints
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // shrink the hit area
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Padding inside the button
                  ),
                  label: const Text('')),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Don’t have an account?',
              style: TextStyle(color: HexColor('#718096'), fontSize: 16),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Register.id);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Palletefy().primaryColor(ThemeModeType.systemMode),
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildFormField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        const Text(
          'Welcome back 👋',
          style:
              TextStyle(fontSize: 30, fontWeight: FontWeight.w600, height: 1.5),
        ),
        Text(
          'Sign in to start using your Pgold Account!',
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
                      hintText: 'name@example.com',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Palletefy()
                              .v3LabelColor(ThemeModeType.systemMode)),
                      errorText: controller.getErrorText('email')),
                ),
              ],
            )),
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
                  obscureText: !controller.state.isPasswordVisible.value,
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 15), // Adjust spacing
                        // child: SvgPicture.asset(
                        //   'assets/images/eye-icon.svg',
                        // ),
                        child: InkWell(
                          onTap: controller.togglePasswordVisibility,
                          child: Icon(
                            controller.state.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: HexColor('#A5ADBB'),
                          ),
                        ),
                      ),
                      hintText: 'Type Password',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color:
                            Palletefy().v3LabelColor(ThemeModeType.systemMode),
                      ),
                      errorText: controller.getErrorText('password')),
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Row(
                  children: [
                    Checkbox(
                      value: controller.state.rememberMe.value,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        controller.toggleRememberMe(val);
                      },
                      side: const BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password!",
                style: TextStyle(
                  fontSize: 14,
                  color: Palletefy()
                      .primaryColor(ThemeModeType.systemMode), // customize
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
