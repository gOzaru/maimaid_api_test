// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/components/color.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicator.dart';

// Project imports:

/*
  Derived from this class: 
    import 'package:loading_progress/loading_progress.dart';
*/

class WgLoading {
  static start(
    BuildContext context, {
    ///Custom width for background Container
    double? width,

    ///Custom height for background Container
    double? height,

    ///Custom padding for background Container
    EdgeInsetsGeometry? padding,

    ///Custom list of colors for loading indicator
    List<Color>? colorProgress,

    ///Custom color for background Container
    Color? color,

    ///Custom indicator type for loading indicator
    Indicator? type,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              width: width ?? 128.0,
              height: height ?? 128.0,
              padding: padding ?? const EdgeInsets.all(8.0),
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(16.0)), color: color ?? const Color.fromARGB(59, 255, 255, 255)),
              child: Center(
                child: LoadingIndicator(indicatorType: type ?? Indicator.ballRotateChase, colors: colorProgress ?? rainbowColors),
              ),
            ),
          ),
        );
      },
    );
  }

  static startFull(
    BuildContext context, {
    ///Custom padding for background Container
    EdgeInsetsGeometry? padding,

    ///Custom list of colors for loading indicator
    List<Color>? colorProgress,

    ///Custom width for background Container
    double? width,

    ///Custom height for background Container
    double? height,

    ///Custom color for background Container
    Color? color,

    ///Custom indicator type for loading indicator
    Indicator? type,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: SizedBox(),
          ),
        );
      },
    );
  }

  static stop(BuildContext context, [bool rootNavigator = true]) {
    return Navigator.of(context, rootNavigator: rootNavigator).pop();
  }
}
