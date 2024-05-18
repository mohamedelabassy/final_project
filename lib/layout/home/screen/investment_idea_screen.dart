// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:final_project/utils/app_image.dart';
import 'package:final_project/view/custom_app_bar/custom_app_bar.dart';
import 'package:final_project/view/custom_app_bar/page_container.dart';
import 'package:flutter/material.dart';

class InvestmentIdeasScreen extends StatefulWidget {
  static const String routeName = 'InvestmentIdeasScreen';
  const InvestmentIdeasScreen({super.key});

  @override
  State<InvestmentIdeasScreen> createState() => _InvestmentIdeasScreenState();
}

final List<String> imagePath = [
  AppImage.calcImage,
  AppImage.earnImage,
  AppImage.payImage,
  AppImage.saveImage,
];
late List<Widget> _pages;
int _currentPage = 0;
final PageController _pageController = PageController(initialPage: 0);
Timer? _timer;

class _InvestmentIdeasScreenState extends State<InvestmentIdeasScreen> {
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePath.length - 1) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(
      imagePath.length,
      (index) => ImagePlace(
        imagePath: imagePath[index],
      ),
    );
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          height: 80,
          titleWidget: const Center(
            child: Text(
              'Investment ideas ',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      controller: _pageController,
                      itemCount: imagePath.length,
                      itemBuilder: (context, index) {
                        return _pages[index];
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 5,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          _pages.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: _currentPage == index
                                    ? Colors.yellow
                                    : Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "1 - Real estate",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "REITs (Real Estate Investment Trusts): REITs are similar to mutual funds, but they invest in real estate ventures. You can buy shares of a REIT and receive dividends from its rental income. REITs offer a way to invest in real estate without the hassle of managing a property yourself.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "2 - Gold",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Physical Gold: Purchase physical gold in the form of bullion bars, coins, or jewelry. This allows you to have direct ownership of the precious metal. Ensure secure storage, either at home or in a safe deposit box, and consider insurance coverage for protection",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "3 - Shares in stock market",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Blue-Chip Stocks: Invest in well-established, large-cap companies with a history of stable earnings, strong competitive advantages, and consistent dividend payments. These companies are often leaders in their respective industries and can provide stability to a portfolio",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "4 -Bank certificates ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "High-Yield CDs: Look for banks offering high-yield CDs with competitive interest rates compared to traditional savings accounts or other fixed-income investments. Online banks and credit unions often offer attractive rates on high-yield CDs due to lower overhead costs",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePlace extends StatelessWidget {
  final String imagePath;
  const ImagePlace({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}
