// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/components/color.dart';

/* Google Font Favorites 
  Crimson,
  Goudy,
  EBGaramond, 
  Vollkorn

  FontWeight ~ Font Style
  {
    FontWeight.w100: 'Thin',
    FontWeight.w200: 'ExtraLight',
    FontWeight.w300: 'Light',
    FontWeight.w400: 'Regular',
    FontWeight.w500: 'Medium',
    FontWeight.w600: 'SemiBold',
    FontWeight.w700: 'Bold',
    FontWeight.w800: 'ExtraBold',
    FontWeight.w900: 'Black',
  }
*/

class FavText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final TextAlign? align;
  final String? family;
  final Color? color;
  final bool? wrap;
  final int? lines;

  const FavText(
    this.text,
    this.size, {
    Key? key,
    this.wrap,
    this.lines,
    this.color,
    this.align,
    this.family,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: (align == null) ? TextAlign.justify : align,
      softWrap: wrap ?? true,
      maxLines: lines ?? 5,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? textColor(),
        fontSize: size,
        height: 1.25,
        fontFamily: family ?? "Crimson",
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  const BulletList(this.text, this.bullet, {Key? key}) : super(key: key);
  final FavText text;
  final Icon bullet;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        bullet,
        const Text(" "),
        Expanded(child: text),
      ],
    );
  }
}

class NumberList extends StatelessWidget {
  final String text;
  final int no;
  final double size;
  const NumberList(this.no, this.size, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FavText(no.toString(), size),
        const Text(". "),
        Expanded(child: FavText(text, size)),
      ],
    );
  }
}

class AlphabetList extends StatelessWidget {
  final FavText text;
  final String no;
  final double size;
  const AlphabetList(this.no, this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FavText(no, size),
        const Text(". "),
        Expanded(child: text),
      ],
    );
  }
}

class Titles extends StatelessWidget {
  final String title;
  const Titles(this.title, {super.key, this.size, this.color, this.align, this.bold});
  final double? size;
  final Color? color;
  final TextAlign? align;
  final FontWeight? bold;

  @override
  Widget build(BuildContext context) {
    return FavText(
      title,
      size ?? 17.0,
      weight: bold ?? FontWeight.bold,
      align: align ?? TextAlign.left,
      lines: 1,
      color: color ?? Colors.black,
    );
  }
}

class TopTitle extends StatelessWidget {
  final String title;
  const TopTitle(this.title, {super.key, this.size, this.color, this.align});
  final double? size;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SizedBox(height: 6.0),
          FavText(
            title,
            size ?? 17.0,
            weight: FontWeight.bold,
            align: align ?? TextAlign.center,
            lines: 1,
            color: color ?? Colors.black,
          ),
        ],
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String title;
  const Subtitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return FavText(title, 15.0, align: TextAlign.left, lines: 1);
  }
}

class Messages extends StatelessWidget {
  final String msg;
  const Messages(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return FavText(msg, 15.0, align: TextAlign.center, lines: 3);
  }
}

class Body extends StatelessWidget {
  final String msg;
  final TextAlign? align;
  const Body(this.msg, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return FavText(msg, 16.0, lines: 50, align: align ?? TextAlign.left, color: Colors.black);
  }
}

class Headline extends StatelessWidget {
  final String msg;
  const Headline(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return FavText(msg, 15.0);
  }
}

class WgText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final TextStyle? style;
  final TextAlign? align;
  final String? family;
  final Color? color;
  final bool? wrap;
  final int? lines;

  const WgText(
    this.text,
    this.size, {
    Key? key,
    this.style = const TextStyle(),
    this.wrap,
    this.lines,
    this.color,
    this.align,
    this.family,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: (align == null) ? TextAlign.justify : align,
      softWrap: wrap ?? true,
      maxLines: lines ?? 2,
      overflow: TextOverflow.ellipsis,
      style: style ??
          TextStyle(
            fontWeight: weight ?? FontWeight.normal,
            color: color ?? textColor(),
            fontSize: size,
            fontFamily: family ?? "Crimson",
          ),
    );
  }
}
