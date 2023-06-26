// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';

// Project imports:

//Derived from package - sweetsheet: ^0.4.0

class CustomSheetColor {
  Color mainColor;
  Color accentColor;
  Color iconColor;

  CustomSheetColor({required this.mainColor, required this.accentColor, required this.iconColor});
}

class SweetSheetColor {
  static CustomSheetColor danger = CustomSheetColor(
    mainColor: const Color(0xffEF5350),
    accentColor: const Color(0xffD32F2F),
    iconColor: Colors.white,
  );
  static CustomSheetColor dangerLight = CustomSheetColor(
    mainColor: Colors.white,
    accentColor: const Color(0xffEF5350),
    iconColor: const Color(0xffD32F2F),
  );
  static CustomSheetColor success = CustomSheetColor(
    mainColor: const Color(0xff009688),
    accentColor: const Color(0xff00695C),
    iconColor: Colors.white,
  );
  static CustomSheetColor successLight = CustomSheetColor(
    mainColor: Colors.white,
    accentColor: const Color(0xff009688),
    iconColor: const Color(0xff00695C),
  );
  static CustomSheetColor warning = CustomSheetColor(
    mainColor: const Color(0xffFF8C00),
    accentColor: const Color(0xffF55932),
    iconColor: Colors.white,
  );
  static CustomSheetColor warningLight = CustomSheetColor(
    mainColor: Colors.white,
    accentColor: const Color(0xffFF8C00),
    iconColor: const Color(0xffF55932),
  );
  static CustomSheetColor nice = CustomSheetColor(
    mainColor: const Color(0xff2979FF),
    accentColor: const Color(0xff0D47A1),
    iconColor: Colors.white,
  );
  static CustomSheetColor niceLight = CustomSheetColor(
    mainColor: Colors.white,
    accentColor: const Color(0xff2979FF),
    iconColor: const Color(0xff0D47A1),
  );
}

class SweetSheet {
  static show({
    required BuildContext context,
    required String title,
    required String description,
    required CustomSheetColor color,
    required SweetSheetAction positive,
    SweetSheetAction? negative,
    EdgeInsets? padding = const EdgeInsets.all(15.0),
    EdgeInsets? actionPadding = const EdgeInsets.all(8.0),
    IconData? icon,
    bool? light,
    bool? useRootNavigator,
    String confirm = "",
    String cancel = "",
    double iconSize = 60,
    double titleFontSize = 18,
    double descriptionFontSize = 16,
    double topLeft = 0, //25
    double topRight = 0, //25
  }) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: false,
      isScrollControlled: true,
      useRootNavigator: (useRootNavigator == null) ? true : useRootNavigator,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: color.mainColor,
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titles(title),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: SingleChildScrollView(
                        child: icon != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(icon, size: iconSize, color: color.iconColor),
                                  const SizedBox(width: 10),
                                  Expanded(child: FavText(description, descriptionFontSize, color: Colors.black)),
                                ],
                              )
                            : FavText(description, descriptionFontSize, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              //This widget is made for the bottom one where we can add icons or text only
              Container(
                color: color.accentColor,
                height: 40,
                child: (negative == null) ? positive : Row(mainAxisAlignment: MainAxisAlignment.end, children: [negative, positive]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SweetSheetAction extends StatelessWidget {
  final String? iconTitle;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color color;

  const SweetSheetAction({
    Key? key,
    required this.iconTitle,
    required this.onPressed,
    this.icon,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: (icon == null)
          ? TextButton(onPressed: onPressed, child: FavText(iconTitle!, 15, color: Colors.white, weight: FontWeight.bold))
          : TextButton.icon(
              onPressed: onPressed,
              label: FavText(iconTitle!, 15, color: Colors.white, weight: FontWeight.bold),
              icon: Icon(icon, color: color),
            ),
    );
  }
}
