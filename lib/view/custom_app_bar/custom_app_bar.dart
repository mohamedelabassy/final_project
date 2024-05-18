import 'package:final_project/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final double height;
  final bool backBtnIsEnabled;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Function? backButtonAction;
  final BuildContext context;

  const CustomAppBar(
    this.context, {
    super.key,
    this.backBtnIsEnabled = true,
    this.titleWidget,
    this.leadingWidget,
    this.trailingWidget,
    this.backButtonAction,
    this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: AppColor.mainAppColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leadingWidget != null)
            leadingWidget!
          else if (backBtnIsEnabled)
            const Spacer(
              flex: 3,
            ),
          titleWidget ?? Container(),
          trailingWidget != null ? trailingWidget! : Container(width: 20),
        ],
      ),
    );
  }
}
