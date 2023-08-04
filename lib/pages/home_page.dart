import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import '../bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('BUILD [HOME PAGE]');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Bloc'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().changeTheme();
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('other');
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<CounterBloc, int>(
                      listener: (context, state) {
                        if (state == 10) {
                          context.read<ThemeBloc>().changeTheme();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('Mengubah Thema'),
                            ),
                          );
                        }
                      },
                    ),
                    BlocListener<ThemeBloc, bool>(
                      listener: (context, state) {
                        if (!state) {
                          context.read<CounterBloc>().reset();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('Mereset Data'),
                            ),
                          );
                        }
                      },
                    )
                  ],
                  child: BlocBuilder<CounterBloc, int>(
                    builder: (context, state) {
                      return Text(
                        '$state',
                        style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.read<CounterBloc>().minus(),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => context.read<CounterBloc>().add(),
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
