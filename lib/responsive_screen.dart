import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.web,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget web;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 800;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isWebOver(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1500;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1100) {
            return web;
          } else if (constraints.maxWidth <= 1100 ||
              constraints.maxWidth >= 650) {
            return tablet;
          } else {
            return mobile;
          }
        },
      );
}
