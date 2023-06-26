// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/github/panara/constants/colors.dart';
import 'package:maimaid_api_test/library/widget/github/panara/constants/panara_dialog_type.dart';
import 'package:maimaid_api_test/library/widget/github/panara/widgets/panara_button.dart';

// Project imports:

///
/// This is the PanaraConfirmDialogWidget.
///
class PanaraConfirmDialogWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String? imagePath;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onTapConfirm;
  final VoidCallback onTapCancel;
  final PanaraDialogType panaraDialogType;
  final Color? color;
  final Color? textColor;
  final Color? buttonTextColor;
  const PanaraConfirmDialogWidget({
    Key? key,
    this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onTapConfirm,
    required this.onTapCancel,
    required this.panaraDialogType,
    this.color,
    this.textColor = const Color(0xFF707070),
    this.buttonTextColor = Colors.white,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ? ImageIcon(const AssetImage("assets/images/icons/confirm.png"), color: normal, size: 50.0)
                  : (panaraDialogType == PanaraDialogType.success)
                      ? Icon(Icons.check_circle_outline, color: success, size: 50.0)
                      : (panaraDialogType == PanaraDialogType.warning)
                          ? Icon(Icons.warning_amber_sharp, color: warning, size: 50.0)
                          : Icon(Icons.dangerous_outlined, color: error, size: 50.0),
              const SizedBox(height: 10),
              if (title != null)
                Text(
                  title ?? "",
                  style: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.w600, color: textColor),
                  textAlign: TextAlign.center,
                ),
              if (title != null) const SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(color: textColor, height: 1.5, fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      onTap: onTapCancel,
                      text: cancelButtonText,
                      bgColor: panaraDialogType == PanaraDialogType.normal
                          ? normal
                          : panaraDialogType == PanaraDialogType.success
                              ? success
                              : panaraDialogType == PanaraDialogType.warning
                                  ? warning
                                  : panaraDialogType == PanaraDialogType.error
                                      ? error
                                      : color ?? const Color(0xFF179DFF),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      buttonTextColor: buttonTextColor ?? Colors.white,
                      onTap: onTapConfirm,
                      text: confirmButtonText,
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
Image.asset(
  imagePath ?? 'assets/images/icons/confirm.png',
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

*/