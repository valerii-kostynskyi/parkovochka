import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/data/model/request/parking_request.dart';
import 'package:parkovochka/domain/parking_repository.dart';

part 'parking_event.dart';

class ParkingBloc extends Bloc<ParkingEvent, ParkingRequest> {
  final ParkingRepository parkingRepository =
      GetIt.instance.get<ParkingRepository>();
  bool showButton = false;

  ParkingBloc({required GooglePlaceModel googlePlace})
      : super(ParkingRequest(
          address: googlePlace.address,
          googlePlaceId: googlePlace.googlePlaceId,
          coordinate: googlePlace.coordinate,
          capacity: 'value_1',
          traffic: 'low',
          photoId: null,
          description: null,
          security: true,
          light: true,
          weatherProtection: true,
          userRating: 5,
        )) {
    on<AddCapacityEvent>(addCapacity);
    on<AddSecurityEvent>(addSecurity);
    on<AddLightEvent>(addLight);
    on<AddTrafficEvent>(addTraffic);
    on<AddWetherProtectionEvent>(addWetherProtection);
    on<AddUserRaitingEvent>(addUserRaiting);
    on<ShowButtonEvent>(showButtonFunc);
  }

  void showButtonFunc(ShowButtonEvent event, Emitter<ParkingRequest> emit) {
    showButton = event.showButton;
  }

  void addCapacity(AddCapacityEvent event, Emitter<ParkingRequest> emit) {
    state.capacity = event.capacity;
    emit(state);
  }

  void addTraffic(AddTrafficEvent event, Emitter<ParkingRequest> emit) {
    state.traffic = event.traffic;
    emit(state);
  }

  void addSecurity(AddSecurityEvent event, Emitter<ParkingRequest> emit) {
    state.security = event.security;
    emit(state);
  }

  void addLight(AddLightEvent event, Emitter<ParkingRequest> emit) {
    state.light = event.light;
    emit(state);
  }

  void addWetherProtection(
      AddWetherProtectionEvent event, Emitter<ParkingRequest> emit) {
    state.weatherProtection = event.wetherProtection;
    emit(state);
  }

  void addUserRaiting(AddUserRaitingEvent event, Emitter<ParkingRequest> emit) {
    state.userRating = event.userRaiting;
    emit(state);
  }

  void postParking(BuildContext context) {
    Navigator.pop(context);
    BlocProvider.of<BottomSheetBloc>(context).add(CloseBottomSheetEvent());
    // parkingRepository.postParking(parking: state).then(
    //       (value) => {
    //         BlocProvider.of<BottomSheetBloc>(context).add(HideBottomBarEvent())
    //       },
    //     );
  }
}
