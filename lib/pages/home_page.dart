import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter.dart';

import '../widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // deklarasi state agar lebih mudah digunakan
    Counter mycounter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
        centerTitle: true,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                icon: Icons.remove,
                // menggunakan fungsi pada state
                ontap: () => mycounter
                    .decreament(), // atau BlocProvider.of<Counter>(context).decreament()
              ),
              Container(
                height: 70,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: BlocBuilder(
                    bloc: mycounter,
                    builder: (context, state) {
                      return Text(
                        '${mycounter.state}',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Button(
                icon: Icons.add,
                ontap: () => mycounter.increament(),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<Counter>().reset();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 70,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
