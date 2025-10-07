import 'package:get/get.dart';
import 'package:pgold/modules/auth/services/register_service.dart';
import 'package:pgold/modules/auth/states/register_state.dart';
import 'package:pgold/modules/auth/editors/register_editor.dart';
import 'package:pgold/utils/validator_ext_util.dart';
import '../../../store.dart';
import '../../../utils/screen_util.dart';

class RegisterController extends GetxController with ValidatorExtUtil {
  final state = RegisterState();
  final editor = RegisterEditor();

  // ========== GETTER ==========
  dynamic getErrorText(String field) {
    return state.errors[field] == '' ? null : state.errors[field];
  }

  // ========== MUTATIONS ==========
  void updateUsername(String value) {
    state.username.value = value;
    validate(
      label: 'username',
      value: value,
      rules: 'min:5',
      errors: state.errors,
    );
  }

  void updateFullName(String value) {
    state.fullName.value = value;
    validate(
      label: 'fullname',
      value: value,
      rules: 'required',
      errors: state.errors,
    );
  }

  void updatePhone(
      {required String phone,
      required String countryCode,
      required String countryISOCode}) {
    state.phone.value = phone;
    state.countryCode.value = countryCode;
    state.countryISOCode.value = countryISOCode;
    validate(
      label: 'phone',
      value: phone,
      rules: 'min:9',
      errors: state.errors,
    );
  }

  void updateEmail(String value) {
    state.email.value = value;
    validate(
      label: 'email',
      value: value,
      rules: 'email',
      errors: state.errors,
    );
  }

  void updatePassword(String value) {
    state.password.value = value;
    validate(
      label: 'password',
      value: value,
      rules: 'password',
      errors: state.errors,
    );
  }

  void updatePasswordConfirmation(String value) {
    state.passwordConfirmation.value = value;
    if (value != state.password.value) {
      state.errors['password_confirmation'] = 'Passwords do not match';
    } else {
      state.errors['password_confirmation'] = '';
    }
  }

  void updateMacAddress(String value) {
    state.macAddress.value = value;
    validate(
      label: 'mac_address',
      value: value,
      rules: 'required',
      errors: state.errors,
    );
  }

  void updateReferral(String value) {
    state.referral.value = value;
  }

  void updateReferralSource(String value) {
    state.referralSource.value = value;
  }

  // ========== FORM VALIDATION ==========
  bool canSubmitForm(List<String> fields) => canSubmit(fields, state.errors);

  Future<void> submit() async {
    try {
      final macAddress = await ScreenUtils().macAddress();
      final response = await RegisterService().register(
        username: state.username.value,
        fullName: state.fullName.value,
        phone: state.phone.value,
        countryCode: state.countryCode.value,
        countryISOCode: state.countryISOCode.value,
        email: state.email.value,
        password: state.password.value,
        passwordConfirmation: state.passwordConfirmation.value,
        macAddress: macAddress,
        referral: state.referral.value,
        referralSource: state.referralSource.value,
      );
      AppStore.to.login(response.data['token'], response.data['user']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> searchUsername() async {
    try {
      await RegisterService().searchUsername(state.username.value);
    } catch (e) {
      rethrow;
    }
  }
}
