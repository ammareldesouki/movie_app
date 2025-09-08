import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/local_storge/auth_local_storge.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString("AuthToken");

    if (!mounted) return;

    if (authToken == null || authToken.isEmpty) {
      bool isFirstTime = prefs.getBool("isFirstTime") ?? true;
      if (isFirstTime) {
        await prefs.setBool("isFirstTime", false);
        Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.login);
      }
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.layout);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [Image(image: AssetImage(TImages.SplashScreen))]),
    );
  }
}
