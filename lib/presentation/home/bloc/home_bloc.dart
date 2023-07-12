import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/domain/parking_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ParkingRepository parkingRepository =
      GetIt.instance.get<ParkingRepository>();

  HomeBloc() : super(LoadingParkingList()) {
    on<LoadParkingListEvent>(getParkingList);
  }

  Future<void> getParkingList(LoadParkingListEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingParkingList());
      List<ParkingModel> parkingList = await parkingRepository.getParkingList();
      emit(LoadedParkingList(parkingList: parkingList));
    } catch (e) {
      emit(ParkingListErrorState(exception: e));
    }
  }
}