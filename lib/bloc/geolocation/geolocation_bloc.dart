import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/repository/geolocation_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository =
      GetIt.instance.get<GeolocationRepository>();

  GeolocationBloc() : super(GeolocationInitialState()) {
    on<LoadGeolocationEvent>(_getCurrentPosition);
  }

  _getCurrentPosition(
      LoadGeolocationEvent event, Emitter<GeolocationState> emit) async {
    try {
      final Position? position =
          await _geolocationRepository.getCurrentPosition();

      if (position != null) {
        print(position);
        emit(GeolocationLoadedState(position: position));
      }
    } catch (exeption, stackTrace) {
      emit(GeolocationErrorState(exeption: exeption));
      GetIt.I<Talker>().handle(exeption, stackTrace);
    }
  }
}
