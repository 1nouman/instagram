import 'package:flutter/material.dart';

import '../utills/dimensions.dart';


class ResponsiveScreenLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveScreenLayout({Key? key , required this.mobileScreenLayout, required this.webScreenLayout}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder
      (builder:(context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return webScreenLayout;
      }
      return mobileScreenLayout;
    });
  }
}
