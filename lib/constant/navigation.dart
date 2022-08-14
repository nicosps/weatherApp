import 'package:flutter/material.dart';

class Navigation {
  static void navigatePage(BuildContext context, page) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => page)));
  }

  static void backToPreviousPage(
    BuildContext context,
  ) {
    Navigator.pop(context);
  }
}
