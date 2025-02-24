import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/views/home/home_view.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: ColorConstant.scaffoldBg,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: ColorConstant.scaffoldBg,
            ),
            Icon(
              Icons.notifications_active,
              size: 30,
              color: ColorConstant.scaffoldBg,
            ),
          ],
          color: ColorConstant.primary,
          buttonBackgroundColor: ColorConstant.primary,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {},
          letIndexChange: (index) => true,
        ),
        body: HomeView());
  }
}
