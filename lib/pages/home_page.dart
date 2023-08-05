import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              subtitle: BlocSelector<UserBloc, Map<String, dynamic>, String>(
                selector: (state) => state['name'],
                builder: (context, state) {
                  print('BUILD NAME');
                  return Text(state);
                },
              ),
              style: ListTileStyle.list,
              tileColor: Colors.amber.shade300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: const Text('Age'),
              subtitle: BlocSelector<UserBloc, Map<String, dynamic>, int>(
                selector: (state) => state['age'],
                builder: (context, state) {
                  print('BUILD AGE');
                  return Text('$state');
                },
              ),
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
