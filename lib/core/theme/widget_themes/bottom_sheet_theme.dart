import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';


class BottomNavTheme {


  static BottomNavigationBarThemeData dark = BottomNavigationBarThemeData(
    backgroundColor: TColors.dark,
    selectedItemColor: TColors.primary,
    unselectedItemColor: Colors.white,
    selectedIconTheme: IconThemeData(size: 28),
    unselectedIconTheme: IconThemeData(size: 22),
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    elevation: 5,
  );
}
