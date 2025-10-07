import 'package:pgold/utils/validator_util.dart';
import 'package:get/get.dart';

mixin ValidatorExtUtil {
  bool canSubmit(List<String> datas, RxMap<dynamic, dynamic> errors) {
    int pass = 0;
    for (final data in datas) {
      if (errors.containsKey(data) && errors[data] == '') {
        pass++;
      }
    }

    if (pass != datas.length) {
      return false;
    } else {
      return true;
    }
  }

  void validate(
      {required String label,
      required String value,
      required String rules,
      String errMsg = '',
      required RxMap<dynamic, dynamic> errors}) {
    final errorBag = ValidatorUtil({
      label: value,
    }).validate({
      label: rules,
    }).errorBag[label];
    errors[label] =
        (errorBag == '') ? errorBag : (errMsg == '' ? errorBag : errMsg);
  }
}
