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

class CounterCubit extends Cubit<int> {
  CounterCubit({this.init = 0}) : super(init);

  int init;

  void increament() {
    emit(state + 1);
  }

  void decreament() {
    emit(state - 1);
  }

  // Here...
  // Fitur untuk memantau perubahan dari state
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  // Fitur untuk memantau error dari state
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
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
            initialData: myCounter.init,
            stream: myCounter.stream,
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
