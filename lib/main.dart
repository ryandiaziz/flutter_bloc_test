import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/app.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';
import 'package:flutter_bloc_test/bloc/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // dependency injection pada parent wide agar state dapat digunakan pada child widget
    print('APP BUILD [MAIN]');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: const App(),
    );
  }
}
