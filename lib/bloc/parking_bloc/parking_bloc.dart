import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/data/model/coordinate_model.dart';
import 'package:parkovochka/data/model/request/parking_request.dart';
import 'package:parkovochka/domain/parking_repository.dart';

part 'parking_event.dart';

class ParkingBloc extends Bloc<ParkingEvent, ParkingRequest> {
  final ParkingRepository parkingRepository =
      GetIt.instance.get<ParkingRepository>();
  bool showButton = false;

  ParkingRequest parkingRequest = ParkingRequest(
    address: '',
    googlePlaceId: '',
    coordinate: CoordinateModel(
      latitude: 0.0,
      longitude: 0.0,
    ),
    capacity: 'value_1',
    traffic: 'low',
    photoId: null,
    description: null,
    security: true,
    light: true,
    weatherProtection: true,
    userRating: 5,
  );

  ParkingBloc()
      : super(
          ParkingRequest(
            address: '',
            googlePlaceId: '',
            coordinate: CoordinateModel(
              latitude: 0.0,
              longitude: 0.0,
            ),
            capacity: 'value_1',
            traffic: 'low',
            photoId: null,
            description: null,
            security: true,
            light: true,
            weatherProtection: true,
            userRating: 5,
          ),
        ) {
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
    parkingRequest.capacity = event.capacity;
    emit(parkingRequest);
  }

  void addTraffic(AddTrafficEvent event, Emitter<ParkingRequest> emit) {
    parkingRequest.traffic = event.traffic;
    emit(parkingRequest);
  }

  void addSecurity(AddSecurityEvent event, Emitter<ParkingRequest> emit) {
    parkingRequest.security = event.security;
    emit(parkingRequest);
  }

  void addLight(AddLightEvent event, Emitter<ParkingRequest> emit) {
    parkingRequest.light = event.light;
    emit(parkingRequest);
  }

  void addWetherProtection(
      AddWetherProtectionEvent event, Emitter<ParkingRequest> emit) {
    parkingRequest.weatherProtection = event.wetherProtection;
    emit(parkingRequest);
  }

  void addUserRaiting(AddUserRaitingEvent event, Emitter<ParkingRequest> emit) {
    parkingRequest.userRating = event.userRaiting;
    emit(parkingRequest);
  }
}
