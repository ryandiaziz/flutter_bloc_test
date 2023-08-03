import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/pages/home_page.dart';
import 'package:flutter_bloc_test/pages/oher_page.dart';

class MyRouter {
  static const String other = 'other';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case "other":
        return MaterialPageRoute(
          builder: (context) => const OtherPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No page route provide'),
            ),
          ),
        );
    }
  }
}
