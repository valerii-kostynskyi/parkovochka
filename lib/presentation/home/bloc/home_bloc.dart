import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(0)) {
    on<ZoomInEvent>(_zoomIn);
    on<ZoomOutEvent>(_zoomOut);
  }

  _zoomIn(ZoomInEvent event, Emitter<HomeState> emit) {
    emit(HomeState(state.zoomNumber + 1));
  }

  _zoomOut(ZoomOutEvent event, Emitter<HomeState> emit) {
    emit(HomeState(state.zoomNumber - 1));
  }
}
