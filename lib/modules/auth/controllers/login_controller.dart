import 'package:get/get.dart';
import 'package:pgold/store.dart';
import 'package:pgold/utils/validator_ext_util.dart';
import '../../../utils/flex_util.dart';
import '../../../utils/screen_util.dart';
import '../../../utils/session_util.dart';
import '../editors/login_editor.dart';
import '../services/login_service.dart';
import '../states/login_state.dart';

class LoginController extends GetxController with ValidatorExtUtil {
  final state = LoginState();
  final editor = LoginEditor();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    loadRememberedEmail();
  }

  // //@@@ MUTATION
  dynamic getErrorText(value) {
    return state.errors[value] == '' ? null : state.errors[value];
  }

  //
  void togglePasswordVisibility() {
    state.isPasswordVisible.value = !state.isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    state.rememberMe.value = value ?? false;
    if (state.rememberMe.value) {
      SessionUtil().write('remembered_email', editor.email.text);
    } else {
      SessionUtil().remove('remembered_email');
    }
  }

  void loadRememberedEmail() {
    final storedEmail = SessionUtil().read('remembered_email');
    if (storedEmail != null) {
      editor.email.text = storedEmail;
      updateEmail(storedEmail);
      state.rememberMe.value = true;
    }
  }

  void updateEmail(String value) {
    state.email.value = value;
    validate(
        label: 'email', value: value, rules: 'email', errors: state.errors);
  }

  void updatePassword(String value) {
    state.password.value = value;
    validate(
        label: 'password',
        value: value,
        rules: 'password',
        errors: state.errors);
  }

  //
  void updateTogglePasswordVisibility() {
    state.togglePasswordVisibility.value =
        !state.togglePasswordVisibility.value;
  }

  void updatePasswordVisibility(bool value) {
    state.togglePasswordVisibility.value = value;
  }

  bool canSubmitForm(List<String> data) => canSubmit(data, state.errors);

  // ACTIONS
  Future<void> submit({activateBiometric = false}) async {
    try {
      final macAddress = await ScreenUtils().macAddress();
      final deviceInfo = await FlexUtil.getDeviceInfo();
      toggleRememberMe(state.rememberMe.value);

      final response = await LoginService().login(
        state.email.value,
        state.password.value,
        macAddress,
        deviceInfo,
      );
      AppStore.to.login(response.data['token'], response.data['user']);
    } catch (e) {
      rethrow;
    }
  }
}
