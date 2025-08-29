import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';


class OnBoardingContainer extends StatelessWidget {
  final int boardingnum;
  final String title;
  final String description;
  const OnBoardingContainer({
    super.key,
    required this.boardingnum,
    required this.title,  this.description='',
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Image(
          image: AssetImage(
            "assets/images/onboarding$boardingnum.png",
          ),
          fit: BoxFit.cover,

        ),
      ),
    );
  }
}
