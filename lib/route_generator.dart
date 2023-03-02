import 'package:flutter/material.dart';

import 'presentation/screens/display_screen.dart';
import 'presentation/screens/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // switch (settings.name) {
    // case '/hello':
    return MaterialPageRoute(builder: (_) {
      if (settings.name == null ||
          settings.name!.isEmpty ||
          settings.name == '/') {
        return const HomeScreen();
      } else {
        return DisplayScreen(
          siteUrl: settings.name,
        );
      }
    });
    // }
  }
}
