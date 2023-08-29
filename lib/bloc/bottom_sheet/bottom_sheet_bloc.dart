import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/domain/parking_repository.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  final ParkingRepository parkingRepository =
      GetIt.instance.get<ParkingRepository>();

  BottomSheetBloc() : super(BottomSheetInitial()) {
    on<ChangeQuestionEvent>(changePageIndex);
    on<ChangeButtonVisibilityEvent>(changeButtonVisibility);
  }

  void changeButtonVisibility(
      ChangeButtonVisibilityEvent event, Emitter<BottomSheetState> emit) {
    emit(ButtonVisibilityState(showButton: event.showButton));
  }

  void changePageIndex(
      ChangeQuestionEvent event, Emitter<BottomSheetState> emit) {
    if (event.page == 5) {
      emit(const ButtonVisibilityState(showButton: true));
    } else {
      emit(const ButtonVisibilityState(showButton: false));
    }
  }
}
