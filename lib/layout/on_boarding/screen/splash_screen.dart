import 'package:final_project/layout/home/screen/home_screen.dart';
import 'package:final_project/theme/app_color.dart';
import 'package:final_project/utils/extension.dart';
import 'package:final_project/utils/navigator_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _isStart = false;
  final bool _isEnd = false;
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    setState(() {
      _isStart = true;
    });
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isEnd
            ? const SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //     SvgPicture.asset(AppImages.appSplashLogoIcon),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  Positioned(
                    top: _isStart ? 350 : -500,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: SlideTransition(
                        position: slidingAnimation,
                        child: Image.asset('assets/images/splash.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: _isStart ? context.height() - 610 : -1000,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: SlideTransition(
                        position: slidingAnimation,
                        child: Text(
                          "ZABATLY ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainAppColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.linearToEaseOut,
    ));

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 10),
      () {
        NavigatorMethods.pushNamedAndRemoveUntil(context, HomeScreen.routeName);
      },
    );
  }
}
