import 'package:flutter/material.dart';

class NavigatorMethods {
  static void pushNamed(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static void pushReplacementNamed(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static void pushNamedAndRemoveUntil(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void showAppDialog(
    BuildContext context,
    Widget dialog, {
    bool willPop = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: willPop,
      builder: (context) {
        return WillPopScope(
          child: dialog,
          onWillPop: () async => willPop,
        );
      },
    );
  }

  static void showAppBottomSheet(
    BuildContext context,
    Widget bottomSheet, {
    bool willPop = true,
    bool isScrollControlled = false,
    bool enableDrag = true,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: isScrollControlled,
      isDismissible: willPop,
      enableDrag: enableDrag,
      context: context,
      builder: (context) {
        return WillPopScope(
          child: bottomSheet,
          onWillPop: () async => willPop,
        );
      },
    );
  }
}
