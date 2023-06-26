import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maimaid_api_test/library/widget/components/color.dart';
import 'package:maimaid_api_test/library/widget/components/enums.dart';
import 'package:maimaid_api_test/library/widget/components/icons.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicator.dart';
import 'package:maimaid_api_test/library/widget/github/panara/widgets/panara_button.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';

const Color black = Colors.black87;
const Color white = Colors.white;

class Loading extends StatelessWidget {
  final double? size;
  final int active;
  final String? label;
  const Loading(
    this.size,
    this.active, {
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: (active == 1)
            ? Container(
                width: size ?? 128.0,
                height: size ?? 128.0,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: const LoadingIndicator(indicatorType: Indicator.ballRotateChase, colors: rainbowColors),
              )
            : (active == 2)
                ? Container(
                    width: size ?? 128.0,
                    height: size ?? 128.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0)), color: Color.fromARGB(88, 44, 44, 44)),
                    child: const LoadingIndicator(indicatorType: Indicator.ballRotateChase, colors: rainbowColors),
                  )
                : Column( //active > 2
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size ?? 128.0,
                        height: size ?? 128.0,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0)), color: Color.fromARGB(88, 44, 44, 44)),
                        child: const LoadingIndicator(indicatorType: Indicator.ballRotateChase, colors: rainbowColors),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.0,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3.0)), color: Color.fromARGB(88, 44, 44, 44)),
                        child: Center(
                          child: FavText(
                            label ?? "Loading",
                            14.0,
                            color: Colors.white,
                            align: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
      ),
    );
  }
}

class PanInfo extends StatelessWidget {
  const PanInfo(this.title, this.message, this.dialog, this.callback, {super.key});
  final String? title;
  final String message;
  final WgDialogType? dialog;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 210,
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: bgColor(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                custIcon(title!),
                const SizedBox(height: 10),
                FavText(title!, 16.0, color: textColor(), align: TextAlign.center, weight: FontWeight.bold),
                const SizedBox(height: 10),
                FavText(message, 14.0, color: textColor(), align: TextAlign.center),
                const SizedBox(height: 20),
                PanaraButton(
                  buttonTextColor: white,
                  bgColor: dialogType(title!),
                  isOutlined: false,
                  text: "Okay",
                  onTap: () {
                    if (callback == null) {
                      Get.back(closeOverlays: true);
                    } else {
                      callback;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PanAsk extends StatelessWidget {
  const PanAsk(this.title, this.message, {super.key, this.type, this.ok, this.cancel});
  final String title;
  final String message;
  final WgDialogType? type;
  final VoidCallback? ok;
  final VoidCallback? cancel;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 210,
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: bgColor(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                custIcon(title),
                const SizedBox(height: 10),
                FavText(title, 16.0, color: textColor()),
                const SizedBox(height: 5),
                FavText(message, 14.0, color: textColor()),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: PanaraButton(
                        buttonTextColor: white,
                        bgColor: dialogType(title),
                        isOutlined: false,
                        text: "Cancel",
                        onTap: () {
                          if (cancel == null) {
                            Get.back(closeOverlays: true);
                          } else {
                            cancel;
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: PanaraButton(
                        buttonTextColor: white,
                        bgColor: dialogType(title),
                        isOutlined: false,
                        text: "Ok",
                        onTap: () {
                          if (ok == null) {
                            Get.back(closeOverlays: true);
                          } else {
                            ok;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget panara(String? title, String? message, WgDialogType? dialog, VoidCallback? callback) {
  return WillPopScope(
    onWillPop: () async => false,
    child: Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 210,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: (Get.isDarkMode == false) ? white : black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custIcon(title!),
              const SizedBox(height: 10),
              Titles(title),
              const SizedBox(height: 10),
              Messages(message!),
              const SizedBox(height: 20),
              PanaraButton(
                buttonTextColor: white,
                text: "Ok",
                onTap: (callback == null) ? () => Get.back() : callback,
                bgColor: dialogType(title),
                isOutlined: false,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget confirm(String? message, WgDialogType? dialog, VoidCallback? ok, VoidCallback? cancel) {
  return WillPopScope(
    onWillPop: () async => false,
    child: Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 210,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: bgColor(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custIcon("Warning"),
              const SizedBox(height: 10),
              const Titles("Warning"),
              const SizedBox(height: 5),
              Messages(message!),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      buttonTextColor: white,
                      bgColor: inActive(WgDialogType.WARNING),
                      isOutlined: false,
                      text: "Cancel",
                      onTap: () {
                        if (cancel == null) {
                          Get.back(closeOverlays: true);
                        } else {
                          cancel;
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      buttonTextColor: white,
                      bgColor: state(WgDialogType.WARNING),
                      isOutlined: false,
                      text: "Ok",
                      onTap: () async {
                        if (ok == null) {
                          Get.back(closeOverlays: true);
                        } else {
                          ok;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
