import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  final HomeBloc homeBloc;
  BottomSheetBloc({required this.homeBloc}) : super(BottomSheetInitial()) {
    on<ShowBottomSheetEvent>(openBottomSheet);
    on<CloseBottomSheetEvent>(closeBottomSheet);
  }

  void openBottomSheet(
      ShowBottomSheetEvent event, Emitter<BottomSheetState> emit) async {
    try {
      emit(ShowBottomSheetState(googlePlace: event.googlePlace));
    } catch (e) {
      emit(BottomSheetErrorState(exception: e));
    }
  }

  void closeBottomSheet(
      CloseBottomSheetEvent event, Emitter<BottomSheetState> emit) async {
    try {
      emit(HideBottomSheetState());
    } catch (e) {
      emit(BottomSheetErrorState(exception: e));
    }
  }
}
