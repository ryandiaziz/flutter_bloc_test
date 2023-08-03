import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';
import 'package:flutter_bloc_test/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {
    // dependency injection pada parent wide agar state dapat digunakan pada child widget
    return BlocProvider(
      create: (context) => mycounter,
      child: const MaterialApp(
        onGenerateRoute: MyRouter.onGenerateRoute,
      ),
    );
  }
}
