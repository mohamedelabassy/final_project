import 'package:final_project/theme/app_color.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final Widget? child;
  const PageContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.mainAppColor,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        ));
  }
}
