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
          BlocListener<Counter, int>(
            bloc: myCounter,
            listenWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 300),
                  content: Text(
                    '$state adalah data genap!',
                  ),
                ),
              );
            },
            child: BlocBuilder<Counter, int>(
              bloc: myCounter,
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
            ),
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
