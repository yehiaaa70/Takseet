import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';

import 'LoginScreen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/lottie/payment.json",
      title: "تقسيط",
      desc:
      "  برنامج يسهل عليك عمليه التقسيط منتجاتك  ",
    ),
    OnbordingData(
      imagePath: "assets/lottie/client.json",
      title: "العملاء",
      desc:
      "متابعه عمليات التقسيط مع العملاء ومعاد الدفع والسداد",
    ),
    OnbordingData(
      imagePath: "assets/lottie/earn.json",
      title: "الارباح",
      desc:
      "معرفعه ارباحك من كل عميل وجموع ارباح طول الشهر ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(
          list, MaterialPageRoute(builder: (context) =>  Login())),
    );
  }
}