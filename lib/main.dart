import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';
import 'package:flutter_bloc_test/bloc/theme.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return MaterialApp(
            theme: state ? ThemeData.light() : ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
