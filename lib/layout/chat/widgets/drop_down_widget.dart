import 'package:final_project/layout/chat/constants/constants.dart';
import 'package:flutter/material.dart';

class ModelsDrawDownWidget extends StatefulWidget {
  const ModelsDrawDownWidget({super.key});

  @override
  State<ModelsDrawDownWidget> createState() => _ModelsDrawDownWidgetState();
}

class _ModelsDrawDownWidgetState extends State<ModelsDrawDownWidget> {
  String currentModel = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      iconEnabledColor: Colors.white,
      dropdownColor: scaffoldBackgroundColor,
      items: getModelItems,
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
        });
      },
    );
  }
}
