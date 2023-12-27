import 'package:flutter/material.dart';
import 'package:hey_flutter_task/presentation/screens/home/home_screen.dart';

import '../../presentation/screens/login/check_user_screen.dart';
import '../../presentation/screens/login/login_screen.dart';
import '../../presentation/screens/signup/signup_screen.dart';

class AppRoutes {
  static const String CHECK_USER_SCREEN = "/check_user_screen";
  static const String SIGN_UP_SCREEN = "/sign_up_view";
  static const String LOGIN_SCREEN = "/login_view";
  static const String HOME = "/home";

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CHECK_USER_SCREEN:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const CheckUserScreen(),
          );
        }

      case LOGIN_SCREEN:
        {
          final String email = routeSettings.arguments as String;
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => LoginScreen(email),
          );
        }

      case SIGN_UP_SCREEN:
        {
          final String email = routeSettings.arguments as String;
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => SignupScreen(email),
          );
        }

      default:
        {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) => const HomeScreen(),
              fullscreenDialog: false);
        }
    }
  }
}
