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
    on<ShowBottomSheetEvent>(openBottomSheet);
    on<CloseBottomSheetEvent>(closeBottomSheet);
    on<ChangeQuestionEvent>(changePageIndex);
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

  void postParking(GooglePlaceModel googlePlace) {
    parkingRepository.postParking(googlePlace: googlePlace);
  }

  void changePageIndex(
      ChangeQuestionEvent event, Emitter<BottomSheetState> emit) {
    emit(ChangePageState(page: event.page));
  }

  void addCapacity(int index) {}
}
