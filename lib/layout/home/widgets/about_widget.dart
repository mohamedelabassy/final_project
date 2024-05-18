import 'package:final_project/theme/app_color.dart';
import 'package:final_project/utils/expanded.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  final String question;
  final String answer;

  const AboutWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          setState(() {
            _isExpand = !_isExpand;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: _isExpand
                ? AppColor.mainAppColor
                : Colors.grey.withOpacity(0.10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.question,
                  style: TextStyle(
                      fontSize: 18, color: _isExpand ? Colors.white : null),
                ),
              ),
              _isExpand
                  ? const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.add_rounded,
                      color: Colors.grey,
                    )
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
        ),
        child: ExpandedSection(
          expand: _isExpand,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.answer,
              style: TextStyle(fontSize: 18, color: AppColor.mainAppColor),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    ]);
  }
}
