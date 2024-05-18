import 'package:final_project/layout/chat/constants/constants.dart';
import 'package:final_project/layout/chat/widgets/text_widget.dart';
import 'package:final_project/utils/app_image.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                    height: 30,
                    width: 30,
                    chatIndex == 0
                        ? AppImage.personImage
                        : AppImage.openLogoImage),
                const SizedBox(width: 5),
                Expanded(
                  child: TextWidget(
                    label: msg,
                  ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.thumb_up_alt_outlined,
                              color: Colors.white, size: 20),
                          SizedBox(width: 5),
                          Icon(Icons.thumb_down_alt_outlined,
                              color: Colors.white, size: 20),
                        ],
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
