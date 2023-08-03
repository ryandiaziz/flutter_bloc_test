import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';
import 'package:flutter_bloc_test/pages/oher_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {
    // dependency injection pada parent wide agar state dapat digunakan pada child widget
    return MaterialApp(
      // home: BlocProvider(
      //   create: (context) => Counter(),
      //   child: const HomePage(),
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
              value: mycounter,
              child: const HomePage(),
            ),
        '/other': (context) => BlocProvider.value(
              value: mycounter,
              child: const OtherPage(),
            ),
      },
    );
  }
}
