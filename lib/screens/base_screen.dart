import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/constants/size.dart';
import 'package:jemputah_app/screens/featured_screen.dart';
import 'package:jemputah_app/screens/home_screen.dart';
import 'package:jemputah_app/screens/pesanan_screen.dart';
import 'package:jemputah_app/screens/tukar_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Pesanan(),
    Tukar(),
    FeaturedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.brokenWhite,
          backgroundColor: AppColors.mainGreen,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                isHome,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                isHomeNotSelected,
                height: kBottomNavigationBarItemSize,
              ),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                isPesanan,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                isPesananNotSelected,
                height: kBottomNavigationBarItemSize,
              ),
              label: "PESANAN",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                isTukar,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                isTukarNotSelected,
                height: kBottomNavigationBarItemSize,
              ),
              label: "TUKAR",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                isProfil,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                isProfilNotSelected,
                height: kBottomNavigationBarItemSize,
              ),
              label: "PROFIL",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
