import 'package:final_project/layout/chat/screen/chat_screen.dart';
import 'package:final_project/layout/chat/screen/new_chat_screen.dart';
import 'package:final_project/layout/home/screen/home_screen.dart';
import 'package:final_project/layout/home/screen/investment_idea_screen.dart';
import 'package:final_project/layout/on_boarding/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../layout/home/screen/about_screen.dart';

class AppRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AboutScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AboutScreen(),
        );
      case InvestmentIdeasScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const InvestmentIdeasScreen(),
        );
      case ChatScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );
      case NewChatScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const NewChatScreen(),
        );
      default:
        return null;
    }
  }
}
