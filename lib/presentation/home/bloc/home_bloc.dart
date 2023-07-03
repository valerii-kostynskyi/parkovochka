import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(0)) {
    on<CounterIncrementEvent>(_onIcrement);
    on<CounterDecrementEvent>(_onDecrement);
  }

  _onIcrement(CounterIncrementEvent event, Emitter<HomeState> emit) {
    emit(HomeState(state.count + 1));
  }

  _onDecrement(CounterDecrementEvent event, Emitter<HomeState> emit) {
    emit(HomeState(state.count - 1));
  }
}
