import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maimaid_api_test/splash.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.noTransition,
      title: "Maimaid",
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        minWidth: 300,
        defaultName: MOBILE,
        breakpoints: [
          const ResponsiveBreakpoint.resize(300, name: MOBILE),
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(720, name: TABLET),
          const ResponsiveBreakpoint.resize(1280, name: DESKTOP),
          const ResponsiveBreakpoint.resize(1920, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2560, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(4096, name: DESKTOP),
        ],
        background: Container(color: Colors.white),
      ),
      home: const Splash(),
    );
  }
}
