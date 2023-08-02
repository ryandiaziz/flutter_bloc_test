import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter({this.init = 0}) : super(init);

  int init;

  void increament() => emit(state + 1);
  void decreament() => emit(state - 1);
  void reset() => emit(state - state);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}
