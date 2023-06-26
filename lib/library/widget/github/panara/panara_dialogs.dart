// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/github/panara/animations.dart';
import 'package:maimaid_api_test/library/widget/github/panara/constants/panara_dialog_type.dart';

import 'widgets/panara_confirm_dialog_widget.dart';
import 'widgets/panara_info_dialog_widget.dart';

// Project imports:
/// This is the Info dialog with 4 different varients as follows:
/// 1. Success (Green color)
/// 2. Normal (Blue color)
/// 3. Warning (Orange color)
/// 4. Error (Red color)
/// 5. Custom (you can add your own color)
///
/// Also this dialog comes with 6 different animations:
/// 1. AnimatedType.top
/// 2. AnimatedType.bottom
/// 3. AnimatedType.left
/// 4. AnimatedType.right
/// 5. AnimatedType.grow
/// 6. AnimatedType.shrink

class PanaraInfo {
  static show(
    BuildContext context, {
    String? title,
    String? imagePath,
    String? buttonText,
    required String message,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = false,
  }) =>
      showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => PanaraInfoDialogWidget(
          title: title,
          message: message,
          buttonText: buttonText ?? "Ok",
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  static showAnimation(
    BuildContext context, {
    String? title,
    String? imagePath,
    String? buttonText,
    required String message,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    required AnimatedType animatedType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = false,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, newAnimation, child) {
          if (animatedType == AnimatedType.bottom) {
            return Animations.fromBottom(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.top) {
            return Animations.fromTop(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.left) {
            return Animations.fromLeft(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.right) {
            return Animations.fromRight(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.grow) {
            return Animations.grow(animation, newAnimation, child);
          } else {
            return Animations.shrink(animation, newAnimation, child);
          }
        },
        pageBuilder: (animation, newAnimation, child) => PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText ?? "Ok",
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );
}

/// This is the Confirmation dialog with 4 different varients as follows:
/// 1. Success (Green color)
/// 2. Normal (Blue color)
/// 3. Warning (Orange color)
/// 4. Error (Red color)
/// 5. Custom (you can add your own color)
///
/// Also this dialog comes with 6 different animations:
/// 1. AnimatedType.top
/// 2. AnimatedType.bottom
/// 3. AnimatedType.left
/// 4. AnimatedType.right
/// 5. AnimatedType.grow
/// 6. AnimatedType.shrink

class PanaraConfirm {
  static show(
    BuildContext context, {
    String? title,
    String? imagePath,
    String? confirmText,
    String? cancelText,
    required String message,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmText ?? "Ok",
          cancelButtonText: cancelText ?? "Cancel",
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  static showAnimation(
    BuildContext context, {
    String? title,
    String? imagePath,
    String? confirmText,
    String? cancelText,
    required String message,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    required AnimatedType animatedType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
  }) =>
      showGeneralDialog(
        barrierDismissible: false,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, newAnimation, child) {
          if (animatedType == AnimatedType.bottom) {
            return Animations.fromBottom(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.top) {
            return Animations.fromTop(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.left) {
            return Animations.fromLeft(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.right) {
            return Animations.fromRight(animation, newAnimation, child);
          } else if (animatedType == AnimatedType.grow) {
            return Animations.grow(animation, newAnimation, child);
          } else {
            return Animations.shrink(animation, newAnimation, child);
          }
        },
        pageBuilder: (animation, newAnimation, child) => PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmText ?? "Ok",
          cancelButtonText: cancelText ?? "Cancel",
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );
}
