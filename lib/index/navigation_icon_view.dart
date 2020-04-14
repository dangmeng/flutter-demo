
import 'package:flutter/material.dart';

class NavigationIconView {

  BottomNavigationBarItem item;
  AnimationController controller;

  NavigationIconView({Widget icon, Widget title, TickerProvider tickerProvider}):
      item = new BottomNavigationBarItem(icon: icon, title: title),
      controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: tickerProvider);



}