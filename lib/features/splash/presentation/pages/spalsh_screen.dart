import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/route/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [Image(image: AssetImage(TImages.SplashScreen))]),
    );
  }
}
