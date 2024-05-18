// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project/layout/home/widgets/about_widget.dart';
import 'package:final_project/view/custom_app_bar/custom_app_bar.dart';
import 'package:final_project/view/custom_app_bar/page_container.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = 'AboutScreen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          height: 90,
          titleWidget: const Center(
            child: Text(
              'About',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          leadingWidget: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColor.mainAppColor,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 20),
              const AboutWidget(
                question: 'What is the purpose of the application?',
                answer:
                    'Zabatly is an application which is made to help people making their budget by letting them chat with the AI to let them know how to manage their income ',
              ),
              const SizedBox(height: 20),
              const AboutWidget(
                question: ' why making budget is important?',
                answer:
                    'A budget helps create financial stability. By tracking expenses and following a plan, a budget makes it easier to pay bills on time, build an emergency fund, and save for major expenses such as a car or home. Overall, a budget puts a person on stronger financial footing for both the day-to-day and the long term.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
