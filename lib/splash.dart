// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/components/path.dart';
import 'package:maimaid_api_test/library/widget/github/splashscreen/splashscreen.dart';
import 'package:maimaid_api_test/menu_first.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SplashScreen.timer(
          seconds: 5,
          navigateAfterSeconds: const FirstPage(),
          title: null,
          image: const Image(image: AssetImage(logo)),
          loadingText: null,
          photoSize: 300.0,
          backgroundColor: Colors.white,
          useLoader: true,
          loadingTextPadding: EdgeInsets.zero,
          styleTextUnderTheLoader: const TextStyle(color: Colors.black, fontSize: 16),
          slogan: ("Everything starts with a dream\nChoose to be happy"),
        ),
      ),
    );
  }
}
