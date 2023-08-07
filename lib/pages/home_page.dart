import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('BUILD SCAFFOLD');
    // extension method
    // 1. context.read() -> hanya membaca sekali saat pertama kali
    // 2. context.watch() -> membaca saat state mengalamu perubahan
    // 3. context.select() -> membaca perubahan state tententu
    // ~~~~~~ Implement ~~~~~~
    UserBloc userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Selector'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: const Text('Name'),
              subtitle: Builder(builder: (context) {
                // ~ Penggunaan extension method watch
                // UserBloc userBloc = context.watch<UserBloc>();
                // return Text(userBloc.state['age'].toString());

                // ~Penggunaan extention method select
                String userBlocN = context.select<UserBloc, String>(
                  (value) => value.state['name'],
                );
                print('BUILD NAME');
                return Text(userBlocN);
              }),
              style: ListTileStyle.list,
              tileColor: Colors.amber.shade300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: const Text('Age'),
              subtitle: Builder(builder: (context) {
                print('BUILD AGE');
                // ~ Penggunaan extension method watch
                // UserBloc userBloc = context.watch<UserBloc>();
                // return Text(userBloc.state['age'].toString());

                // ~Penggunaan extention method select
                int userBlocA = context.select<UserBloc, int>(
                  (value) => value.state['age'],
                );
                return Text(userBlocA.toString());
              }),
              style: ListTileStyle.list,
              tileColor: Colors.amber.shade300,
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
            child: TextField(
              onChanged: (value) => userBloc.changeName(value),
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.grey.shade300,
                  shape: const CircleBorder(),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      userBloc.changeAge(userBloc.state['age'] - 1);
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
                Material(
                  color: Colors.grey.shade300,
                  shape: const CircleBorder(),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      userBloc.changeAge(userBloc.state['age'] + 1);
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
