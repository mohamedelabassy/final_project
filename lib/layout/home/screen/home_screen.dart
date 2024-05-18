import 'package:final_project/layout/chat/screen/new_chat_screen.dart';
import 'package:final_project/layout/home/screen/about_screen.dart';
import 'package:final_project/layout/home/screen/investment_idea_screen.dart';
import 'package:final_project/theme/app_color.dart';
import 'package:final_project/utils/navigator_methods.dart';
import 'package:final_project/view/custom_app_bar/custom_app_bar.dart';
import 'package:final_project/view/custom_app_bar/page_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          height: 90,
          titleWidget: const Text(
            'ZABATLY ',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leadingWidget: const SizedBox(),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                NavigatorMethods.pushNamed(
                    context, InvestmentIdeasScreen.routeName);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_new_rounded),
                      const Spacer(),
                      Text(
                        'Investment ideas',
                        style: TextStyle(
                            color: AppColor.mainAppColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                NavigatorMethods.pushNamed(context, AboutScreen.routeName);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_new_rounded),
                      const Spacer(),
                      Text(
                        'About',
                        style: TextStyle(
                            color: AppColor.mainAppColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                NavigatorMethods.pushNamed(context, NewChatScreen.routeName);
              },
              child: Container(
                width: 230,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.mainAppColor,
                ),
                child: const Center(
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
