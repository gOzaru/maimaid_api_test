import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maimaid_api_test/library/widget/components/color.dart';
import 'package:maimaid_api_test/library/widget/components/enums.dart';
import 'package:maimaid_api_test/library/widget/github/panara/constants/panara_dialog_type.dart';
import 'package:maimaid_api_test/library/widget/github/panara/panara_dialogs.dart';
import 'package:maimaid_api_test/library/widget/github/sweetsheet/snackbar_sweet.dart';
import 'package:maimaid_api_test/library/widget/ui/loading.dart';

class Message extends GetxController {
  RxInt code = 0.obs;
  RxString message = "".obs;
  RxString title = "".obs;
  RxString error = "".obs;
  GetStorage statusAcc = GetStorage();
  late final VoidCallback task;
  late final Function function;

  void goBack() {
    Get.rootDelegate.popHistory();
  }

  void getTask(task) {
    task;
  }

  void errTop(String message, BuildContext context, VoidCallback callback, {String? title}) {
    PanaraInfo.show(
      context,
      title: title ?? "Error",
      message: message,
      buttonText: "Ok",
      onTapDismiss: callback,
      panaraDialogType: PanaraDialogType.error,
    );
  }

  void warnTop(String message, BuildContext context, VoidCallback callback, {String? title}) {
    PanaraInfo.show(
      context,
      title: title ?? "Warning",
      message: message,
      buttonText: "Ok",
      onTapDismiss: callback,
      panaraDialogType: PanaraDialogType.warning,
    );
  }

  void okTop(String message, BuildContext context, VoidCallback callback, {String? title}) {
    PanaraInfo.show(
      context,
      title: title ?? "Success",
      buttonText: "Ok",
      message: message,
      onTapDismiss: callback,
      panaraDialogType: PanaraDialogType.success,
    );
  }

  void ssheetOk(String message, BuildContext context, {VoidCallback? ok}) {
    SweetSheet.show(
      context: context,
      title: "Message",
      description: message,
      color: SweetSheetColor.successLight,
      positive: SweetSheetAction(
        iconTitle: "Ok",
        onPressed: () {
          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
        },
      ),
    );
  }

  void ssheetWarn(String message, BuildContext context, {VoidCallback? ok}) {
    SweetSheet.show(
      context: context,
      title: "Message",
      description: message,
      color: SweetSheetColor.warningLight,
      positive: SweetSheetAction(
        iconTitle: "Ok",
        onPressed: () {
          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
        },
      ),
    );
  }

  void askTop(String message, {WgDialogType? type, VoidCallback? ok, VoidCallback? cancel}) {
    Get.dialog(confirm(message, WgDialogType.WARNING, (ok == null) ? goBack : ok, cancel ?? goBack));
  }

  void okDialog(String message, {VoidCallback? callback, String? title, Widget? button}) {
    Get.defaultDialog(
      middleText: message,
      title: title ?? "Success",
      onConfirm: callback!,
      textConfirm: "Ok",
      barrierDismissible: true,
    );
  }

  void sbarOk(String message, {VoidCallback? callback, String? label, Widget? button}) {
    Get.rawSnackbar(
      title: label ?? "Message",
      message: message,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      instantInit: false,
    );
  }

  void sbarWarn(String message, {VoidCallback? callback, String? label, Widget? button}) {
    Get.rawSnackbar(
      title: label ?? "Warning",
      message: message,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      instantInit: false,
    );
  }

  void sbarErr(String message, {VoidCallback? callback, String? label, Widget? button}) {
    Get.rawSnackbar(
      title: "Error",
      message: message,
      duration: const Duration(seconds: 5),
      backgroundColor: bgColor(),
      snackStyle: SnackStyle.GROUNDED,
      instantInit: false,
    );
  }
}
