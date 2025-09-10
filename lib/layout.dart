import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/features/home/presentation/pages/home_screen.dart';
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
      HomeScreen(),

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: _selectedIndex,
            onTap: onTapItem,

            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(TImages.homeIcon)),

                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(TImages.searchIcon)),
                label: "",
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(TImages.expoloreIcon)),
                label: "",
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(TImages.profileIcon)),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
