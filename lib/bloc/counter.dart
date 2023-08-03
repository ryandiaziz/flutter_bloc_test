import 'package:bloc/bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc({this.init = 0}) : super(init);

  int init;

  void increament() => emit(state + 1);
  void decreament() => emit(state - 1);
  void reset() => emit(state - state);
}
