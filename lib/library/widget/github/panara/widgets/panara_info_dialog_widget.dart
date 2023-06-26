// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/github/panara/constants/colors.dart';
import 'package:maimaid_api_test/library/widget/github/panara/constants/panara_dialog_type.dart';
import 'package:maimaid_api_test/library/widget/github/panara/widgets/panara_button.dart';

// Project imports:

///
/// This is the PanaraInfoDialogWidget.
///
class PanaraInfoDialogWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String? imagePath;
  final String buttonText;
  final VoidCallback onTapDismiss;
  final PanaraDialogType panaraDialogType;
  final Color? color;
  final Color? textColor;
  final Color? buttonTextColor;
  const PanaraInfoDialogWidget({
    Key? key,
    this.title,
    required this.message,
    required this.buttonText,
    required this.onTapDismiss,
    required this.panaraDialogType,
    this.textColor = const Color(0xFF707070),
    this.color = const Color(0xFF179DFF),
    this.buttonTextColor,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //(MediaQuery.of(context).size.width) / 4 * 3
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 210,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (panaraDialogType == PanaraDialogType.normal)
                  ? Icon(Icons.info_outline, color: normal, size: 50.0,)
                  : (panaraDialogType == PanaraDialogType.success)
                      ? Icon(Icons.check_circle_outline, color: success, size: 50.0,)
                      : (panaraDialogType == PanaraDialogType.warning)
                          ? Icon(Icons.warning_amber_sharp, color: warning, size: 50.0,)
                          : Icon(Icons.dangerous_outlined, color: error, size: 50.0,),
              const SizedBox(height: 10),
              if (title != null)
                Text(
                  title ?? "",
                  style: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.w600, color: textColor),
                  textAlign: TextAlign.center,
                ),
              if (title != null) const SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(color: textColor, height: 1.5, fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              PanaraButton(
                buttonTextColor: buttonTextColor ?? Colors.white,
                text: buttonText,
                onTap: onTapDismiss,
                bgColor: panaraDialogType == PanaraDialogType.normal
                    ? normal
                    : panaraDialogType == PanaraDialogType.success
                        ? success
                        : panaraDialogType == PanaraDialogType.warning
                            ? warning
                            : panaraDialogType == PanaraDialogType.error
                                ? error
                                : color ?? const Color(0xFF179DFF),
                isOutlined: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
Image.asset(
  imagePath ?? 'assets/images/icons/info.png',
  width: 50,
  height: 50,
  color: imagePath != null
    ? null
    : (panaraDialogType == PanaraDialogType.normal
    ? normal
    : panaraDialogType == PanaraDialogType.success
    ? success
    : panaraDialogType == PanaraDialogType.warning
    ? warning
    : panaraDialogType == PanaraDialogType.error
    ? error
    : color),
),

(panaraDialogType == PanaraDialogType.normal)
? Icon(Icons.info_outline, color: SweetSheetColor.niceLight.accentColor)
: (panaraDialogType == PanaraDialogType.success)
? Icon(Icons.check_circle_outline, color: SweetSheetColor.successLight.accentColor)
: (panaraDialogType == PanaraDialogType.warning)
? Icon(Icons.warning_amber_sharp, color: SweetSheetColor.warningLight.accentColor)
: Icon(Icons.dangerous_outlined, color: SweetSheetColor.dangerLight.accentColor),
*/