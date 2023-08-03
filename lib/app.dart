import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/routes/routes.dart';

import 'bloc/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print('APP BUILD [APP]');
    return BlocBuilder<ThemeBloc, bool>(
      bloc: context.read<ThemeBloc>(),
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state ? ThemeData.light() : ThemeData.dark(),
          onGenerateRoute: MyRouter.onGenerateRoute,
        );
      },
    );
  }
}
