import 'package:get/get.dart';
import 'package:pgold/modules/auth/bindings/register_binding.dart';
import 'package:pgold/modules/auth/screens/login.dart';
import 'package:pgold/modules/auth/screens/register.dart';
import 'bindings/login_binding.dart';

class AuthRoutes {
  static List<GetPage> all() {
    return [
      GetPage(
        name: Login.id,
        page: () => const Login(),
        //middlewares: [IsGuest()],
        binding: LoginBinding(),
      ),
      GetPage(
        name: Register.id,
        page: () => const Register(),
        //middlewares: [IsGuest()],
        binding: RegisterBinding(),
      ),
    ];
  }
}
