import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// Here...
class CounterCubit extends Cubit<int> {
  CounterCubit({this.init = 0}) : super(init); // constructor

  int init; // data inisialisasi

  void increament() {
    emit(state + 1); // Set data state
  }

  void decreament() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // Membuar object cubit dari class yang sudah dibuat
  CounterCubit myCounter = CounterCubit(init: 13);

  @override
  Widget build(BuildContext context) {
    print('REBUILD');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData:
                myCounter.init, // Memanggil variabel init dari object myCounter
            stream: myCounter.stream, // Memanggil stream dari object myCounter
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myCounter.decreament(),
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              IconButton(
                onPressed: () => myCounter.increament(),
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
