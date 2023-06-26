import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maimaid_api_test/library/widget/ui/loading.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';

class SplashScreen extends StatefulWidget {
  final int? seconds;
  final String? title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final Widget? navigateAfterSeconds;
  final double? photoSize;
  final GestureTapCallback? onClick;
  final Color? loaderColor;
  final Image? image;
  final Image? imgBottom;
  final String? slogan;
  final String? loadingText;
  final EdgeInsets loadingTextPadding;
  final ImageProvider? imageBackground;
  final Gradient? gradientBackground;
  final bool useLoader;
  final Route? pageRoute;
  final String? routeName;

  static const _defaultStyleTextUnderTheLoader = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @protected
  SplashScreen({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.styleTextUnderTheLoader,
    required this.loadingText,
    required this.loadingTextPadding,
    required this.useLoader,
    this.loaderColor,
    this.seconds,
    this.photoSize,
    this.pageRoute,
    this.onClick,
    this.navigateAfterSeconds,
    this.image,
    this.imageBackground,
    this.gradientBackground,
    this.routeName,
    this.imgBottom,
    this.slogan,
  })  : assert(
          routeName == null || (routeName.startsWith('/')),
          'routeName must be a String beginning with forward slash (/)',
        ),
        assert(
          navigateAfterSeconds is Widget,
          'navigateAfterSeconds must be a Widget',
        ),
        super(key: key);

  factory SplashScreen.timer({
    required int seconds,
    String? loadingText,
    Color? loaderColor,
    Color backgroundColor = Colors.white,
    double? photoSize,
    EdgeInsets loadingTextPadding = const EdgeInsets.only(top: 10.0),
    Image? image,
    Route? pageRoute,
    GestureTapCallback? onClick,
    Widget? navigateAfterSeconds,
    String? title,
    TextStyle styleTextUnderTheLoader = _defaultStyleTextUnderTheLoader,
    ImageProvider? imageBackground,
    Gradient? gradientBackground,
    bool useLoader = true,
    String? routeName,
    Image? imgCom,
    String? slogan,
  }) =>
      SplashScreen(
        loaderColor: loaderColor,
        seconds: seconds,
        photoSize: photoSize,
        loadingText: loadingText,
        loadingTextPadding: loadingTextPadding,
        backgroundColor: backgroundColor,
        image: image,
        pageRoute: pageRoute,
        onClick: onClick,
        navigateAfterSeconds: navigateAfterSeconds,
        title: title,
        styleTextUnderTheLoader: styleTextUnderTheLoader,
        imageBackground: imageBackground,
        gradientBackground: gradientBackground,
        useLoader: useLoader,
        routeName: routeName,
        slogan: slogan,
        imgBottom: imgCom,
      );

  @override
  State<SplashScreen> createState() => SplashScreenStateful();
}

class SplashScreenStateful extends State<SplashScreen> {
  late Widget? navOne;
  late int code = -1;
  @override
  void initState() {
    super.initState();
    if (widget.navigateAfterSeconds != null) {
      code = 1;
      navOne = widget.navigateAfterSeconds;
    }
  }

  void page() {
    Get.offAll(() => navOne!);
  }

  @override
  Widget build(BuildContext context) {
    if (code == 1) {
      Timer(Duration(seconds: widget.seconds!), page);
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: widget.imageBackground != null ? DecorationImage(fit: BoxFit.cover, image: widget.imageBackground!) : null,
              gradient: widget.gradientBackground,
              color: widget.backgroundColor,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: widget.onClick,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //App Logo
                          Container(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            width: widget.photoSize,
                            height: widget.photoSize,
                            child: widget.image,
                          ),
                          //Title
                          (widget.title != null) ? FavText(widget.title!, 17, align: TextAlign.center) : const SizedBox(),
                          //Space
                          const SizedBox(height: 30),
                          //Loader
                          (widget.useLoader) ? _isLoader() : const SizedBox(),
                          //Space
                          const SizedBox(height: 10),
                          //Loader Text
                          (widget.loadingText == null) ? const SizedBox(height: 0) : Padding(padding: widget.loadingTextPadding, child: FavText(widget.loadingText!, 17, align: TextAlign.center)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Slogan or Company Name
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                    child: (widget.slogan == null) ? const SizedBox() : FavText(widget.slogan!, 15, align: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _isLoader() {
    return const Center(
      child: Loading(100.0, 1),
    );
  }
}

/*
CircleAvatar(
  backgroundColor: Colors.black45,
  radius: widget.photoSize,
  child: Hero(tag: 'splash', child: Container(child: widget.image)),
),
*/