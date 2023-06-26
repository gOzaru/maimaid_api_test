import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maimaid_api_test/library/widget/components/color.dart';
import 'package:maimaid_api_test/library/widget/components/enums.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';

Icon wgIcon(WgDialogType dialogType) {
  if (dialogType == WgDialogType.MESSAGE) {
    return Icon(Icons.info_outline, color: state(dialogType), size: 50.0);
  } else if (dialogType == WgDialogType.WARNING) {
    return Icon(Icons.warning_amber_sharp, color: state(dialogType), size: 50.0);
  } else if (dialogType == WgDialogType.ERROR) {
    return Icon(Icons.dangerous_outlined, color: state(dialogType), size: 50.0);
  } else {
    return Icon(Icons.check, color: state(dialogType), size: 50.0);
  }
}

Widget bigStar(BuildContext context, int rating) {
  List<Widget> star = [];
  for (var i = 0; i < rating; i++) {
    star.add(Icon(Icons.star, size: 20.0, color: Colors.amber.shade800));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: star,
  );
}

Widget smallStar(BuildContext context, int rating) {
  List<Widget> star = [];
  for (var i = 0; i < rating; i++) {
    star.add(Icon(Icons.star, size: 15.0, color: Colors.amber.shade800));
  }
  return Row(
    children: star,
  );
}

Icon custIcon(String title) {
  if (title == "Message") {
    return wgIcon(WgDialogType.MESSAGE);
  } else if (title == "Warning") {
    return wgIcon(WgDialogType.WARNING);
  } else if (title == "Error") {
    return wgIcon(WgDialogType.ERROR);
  } else {
    return wgIcon(WgDialogType.SUCCESS);
  }
}

Widget custButton(Widget? button, Function()? callback, String? label) {
  if (button == null) {
    return TextButton(
      onPressed: (callback == null) ? () => Get.back() : callback,
      child: (label == null) ? const FavText("Ok", 15.0, color: Colors.white) : FavText(label, 15.0, color: Colors.white),
    );
  } else {
    return button;
  }
}
