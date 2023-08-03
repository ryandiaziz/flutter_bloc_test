import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // dependency injection pada parent wide agar state dapat digunakan pada child widget
    return MaterialApp(
      home: BlocProvider(
        create: (context) => Counter(),
        child: const HomePage(),
      ),
    );
  }
}
