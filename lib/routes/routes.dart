import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/pages/other_page.dart';

import '../pages/home_page.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case 'other':
        return MaterialPageRoute(
          builder: (context) => const OtherPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No page route priovide'),
            ),
          ),
        );
    }
  }
}
