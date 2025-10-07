import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/slide_model.dart';

class OnboardingState {
  var slides = Rx<List<SlideModel>>([
    SlideModel(
      title: "Purchase and Trade Giftcards Effortlessly",
      subtitle:
          "Access the best deals on top-brand giftcards. Buy, Sell, or redeem instantly-no hassles, just value.",
      image: "onboarding-2.svg",
      indicatorImage: "onboarding-indicator-1.svg",
    ),
    SlideModel(
      title: "Secure Payments with  Virtual Dollar Cards",
      subtitle:
          "Create and manage virtual cards for safe and flexible online transastions. Control your spendings with just few taps.",
      image: "onboarding-2.svg",
      indicatorImage: "onboarding-indicator-2.svg",
    ),
  ]);

  final PageController pageController = PageController(initialPage: 0);
}
