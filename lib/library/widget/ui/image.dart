import 'package:flutter/material.dart';

class ImageOnly extends StatelessWidget {
  const ImageOnly({super.key, required this.url, this.size, this.isRounded});
  final String url;
  final double? size;
  final bool? isRounded;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: rounded(context, isRounded ?? false),
      child: Image.network(
        url,
        width: size ?? 84.0,
        height: size ?? 84.0,
        scale: 1.0,
      ),
    );
  }

  BorderRadius rounded(BuildContext context, bool isRounded) {
    if (isRounded == false) {
      return BorderRadius.zero;
    } else {
      return BorderRadius.circular(12.0);
    }
  }
}
