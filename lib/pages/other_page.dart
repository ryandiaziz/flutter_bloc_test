import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import '../bloc/theme.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('BUILD [OTHER PAGE]');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
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
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(140, 60),
            ),
            onPressed: () {
              context.read<CounterBloc>().reset();
            },
            child: const Icon(Icons.recycling_rounded),
          ),
        ],
      ),
    );
  }
}
