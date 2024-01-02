import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/home/views/home_screen.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/login/views/check_user_screen.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/login/views/login_screen.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/signup/views/signup_screen.dart';

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
