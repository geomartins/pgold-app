import 'package:get/get.dart';
import '../states/onboarding_state.dart';

class OnboardingController extends GetxController {
  final state = OnboardingState();

  //STATE
  final _currentSlide = 0.obs;

  //GETTER
  int get currentSlide => _currentSlide.value;

  //MUTATION
  void updateCurrentSlide(int value) {
    _currentSlide.value = value;
  }
}
