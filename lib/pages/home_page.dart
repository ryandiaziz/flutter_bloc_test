import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = Counter(init: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: myCounter,
            buildWhen: (previous, current) {
              if (current >= 10) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  '$state',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
            listener: (context, state) {
              if (state >= 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green.shade400,
                    duration: const Duration(milliseconds: 500),
                    content: Text(
                      '$state adalah data genap!',
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red.shade500,
                    duration: const Duration(milliseconds: 500),
                    content: const Text(
                      'MASI DI BAWAH 10',
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myCounter.decreament(),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => myCounter.increament(),
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
