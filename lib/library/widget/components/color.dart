// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maimaid_api_test/library/widget/components/enums.dart';

Color textPrimary = (Get.isDarkMode == false) ? const Color(0xFF111111) : Colors.white;
Color textSecondary = (Get.isDarkMode == false) ? const Color(0xFF3A3A3A) : Colors.white54;

Color state(WgDialogType dialogType) {
  if (dialogType == WgDialogType.MESSAGE) {
    return const Color(0xFF179DFF);
  } else if (dialogType == WgDialogType.WARNING) {
    return const Color(0xffFF8C00);
  } else if (dialogType == WgDialogType.ERROR) {
    return const Color(0xffEF5350);
  } else if (dialogType == WgDialogType.SUCCESS) {
    return const Color(0xFF61D800);
  } else {
    return Colors.white;
  }
}

Color inActive(WgDialogType dialogType) {
  if (dialogType == WgDialogType.MESSAGE) {
    return const Color.fromARGB(255, 148, 210, 254);
  } else if (dialogType == WgDialogType.WARNING) {
    return const Color.fromARGB(255, 255, 191, 113);
  } else if (dialogType == WgDialogType.ERROR) {
    return const Color.fromARGB(255, 239, 137, 135);
  } else if (dialogType == WgDialogType.SUCCESS) {
    return const Color.fromARGB(255, 157, 211, 113);
  } else {
    return Colors.white;
  }
}

Color bgColor() {
  if (Get.isDarkMode == false) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

Color textColor() {
  if (Get.isDarkMode == false) {
    return Colors.black;
  } else {
    return Colors.white38;
  }
}

Color textButton() {
  if (Get.isDarkMode == false) {
    return Colors.white;
  } else {
    return Colors.white38;
  }
}

Color dialogType(String title) {
  if (title == "Message") {
    return state(WgDialogType.MESSAGE);
  } else if (title == "Error") {
    return state(WgDialogType.ERROR);
  } else if (title == "Warning") {
    return state(WgDialogType.WARNING);
  } else {
    return state(WgDialogType.SUCCESS);
  }
}

//These whole List are made for Glassmorphism package use
List<Color> linearOrange = [
  const Color.fromARGB(24, 173, 74, 4).withOpacity(0.3),
  const Color.fromARGB(100, 173, 74, 4).withOpacity(0.3),
  const Color.fromARGB(170, 209, 128, 6).withOpacity(0.1),
];

List<Color> borderOrange = [
  const Color.fromARGB(15, 173, 74, 4).withOpacity(0.2),
  const Color.fromARGB(170, 209, 128, 6).withOpacity(0.2),
];

List<Color> linearPurple = [
  const Color.fromARGB(23, 111, 4, 173).withOpacity(0.3),
  const Color.fromARGB(99, 94, 4, 173).withOpacity(0.3),
  const Color.fromARGB(170, 114, 6, 209).withOpacity(0.1),
];

List<Color> borderPurple = [
  const Color.fromARGB(15, 108, 4, 173).withOpacity(0.2),
  const Color.fromARGB(170, 121, 6, 209).withOpacity(0.2),
];

List<Color> linearYellow = [
  const Color.fromARGB(21, 173, 159, 4).withOpacity(0.3),
  const Color.fromARGB(97, 162, 173, 4).withOpacity(0.3),
  const Color.fromARGB(170, 209, 202, 6).withOpacity(0.1),
];

List<Color> borderYellow = [
  const Color.fromARGB(15, 173, 162, 4).withOpacity(0.2),
  const Color.fromARGB(170, 202, 209, 6).withOpacity(0.2),
];

List<Color> linearRed = [
  const Color.fromARGB(20, 173, 4, 4).withOpacity(0.3),
  const Color.fromARGB(96, 173, 4, 29).withOpacity(0.3),
  const Color.fromARGB(170, 209, 6, 6).withOpacity(0.1),
];

List<Color> borderRed = [
  const Color.fromARGB(15, 173, 4, 21).withOpacity(0.2),
  const Color.fromARGB(170, 209, 6, 9).withOpacity(0.2),
];

List<Color> linearWhite = [
  const Color.fromARGB(47, 255, 255, 255).withOpacity(0.1),
  const Color(0x0fffffff).withAlpha(100),
];

List<Color> borderWhite = [
  const Color.fromARGB(47, 255, 255, 255).withOpacity(0.1),
  const Color(0x0fffffff).withAlpha(100),
  const Color(0x0fffffff).withAlpha(01),
];

const List<Color> rainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];
