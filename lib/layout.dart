

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/features/profile/presentation/pages/profile_screen.dart';

class Layout extends StatefulWidget {

  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [
      ProfileScreen(),
      ProfileScreen(),

      ProfileScreen(),
      ProfileScreen(),


    ];
    void onTapItem(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTapItem,

        items: [
          BottomNavigationBarItem(
            icon:ImageIcon(AssetImage(TImages.homeIcon)),

              label: ""

          ),
          BottomNavigationBarItem(
            icon:ImageIcon( AssetImage(TImages.searchIcon)),
              label: ""

          ),

          BottomNavigationBarItem(
            icon:
               ImageIcon( AssetImage(TImages.expoloreIcon)),
              label: ""

          ),


          BottomNavigationBarItem(
            icon:  ImageIcon( AssetImage(TImages.profileIcon)),
          label: ""
          ),


        ],
      ),

    );
  }
}
