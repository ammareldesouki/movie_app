


import 'package:flutter/material.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/features/auth/presentation/pages/forget_password.dart';
import 'package:movie_app/features/auth/presentation/pages/login_screen.dart';
import 'package:movie_app/features/auth/presentation/pages/sign_up.dart';
import 'package:movie_app/features/on_boarding/presentation/pages/on_boarding.dart';
import 'package:movie_app/features/profile/presentation/pages/edit_profile.dart';
import 'package:movie_app/features/splash/presentation/pages/spalsh_screen.dart';
import 'package:movie_app/layout.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );



       case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
          settings: settings,
        );

        case RouteNames.login:

          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
            settings: settings,
          );
      case RouteNames.register:
        return MaterialPageRoute(
          builder: (_) =>SignUpScreen(),
          settings: settings,
        );

        case RouteNames.forgetPassword:
          return MaterialPageRoute(
            builder: (_) => ForgotPasswordScreen(),

          );
          case RouteNames.layout:
            return MaterialPageRoute(
              builder: (_) => Layout(),
        );
      case RouteNames.updateProfile:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        );




      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
