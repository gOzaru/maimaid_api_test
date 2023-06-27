
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/components/color.dart';
import 'package:maimaid_api_test/library/widget/components/enums.dart';
import 'package:maimaid_api_test/library/widget/components/spacing.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.label, required this.ctrl, this.type});
  final TextEditingController ctrl;
  final String label;
  final TextType? type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FavText(label, 16.0),
        space,
        Expanded(
          child: TextFormField(
            autofocus: true,
            controller: ctrl,
            style: TextStyle(color: textColor(), fontSize: 15.0),
            decoration: processType(type ?? TextType.SHORT),
          ),
        ),
      ],
    );
  }

  InputDecoration processType(TextType type) {
    if (type == TextType.LONG) {
      return const InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: false,
        constraints: BoxConstraints(maxWidth: 84.0, maxHeight: 100.0),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.blueGrey)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.blueGrey)),
      );
    } else {
      return const InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: false,
        constraints: BoxConstraints(maxWidth: 84.0, maxHeight: 28.0),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.blueGrey)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.blueGrey)),
      );
    }
  }
}
