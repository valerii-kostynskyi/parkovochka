import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/repository/geolocation_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository =
      GetIt.instance.get<GeolocationRepository>();

  GeolocationBloc() : super(GeolocationInitialState()) {
    on<LoadGeolocationEvent>(_getCurrentPosition);
    on<AddMarkerEvent>(_addMarker);
  }

  _getCurrentPosition(
      LoadGeolocationEvent event, Emitter<GeolocationState> emit) async {
    try {
      final Position? position =
          await _geolocationRepository.getCurrentPosition();

      if (position != null) {
        final String placeId =
            await _geolocationRepository.getPlaceIdFromLatLng(
          lat: position.latitude,
          lng: position.longitude,
        );
        emit(
          GeolocationLoadedState(
            position: position,
            placeId: placeId,
          ),
        );
      }
    } catch (exeption, stackTrace) {
      emit(GeolocationErrorState(exeption: exeption));
      GetIt.I<Talker>().handle(exeption, stackTrace);
    }
  }

  void _addMarker(AddMarkerEvent event, Emitter<GeolocationState> emit) async {
    try {
      final GeolocationLoadedState currentState =
          state as GeolocationLoadedState;
      final List<Marker> updatedMarkers = List.from(currentState.markers)
        ..add(event.marker);
      final double latitude = event.marker.position.latitude;
      final double longitude = event.marker.position.longitude;
      final String placeId = await _geolocationRepository.getPlaceIdFromLatLng(
        lat: latitude,
        lng: longitude,
      );
      final GooglePlaceModel placeModel =
          await _geolocationRepository.getLocationDetails(
        placeId: placeId,
      );

      emit(currentState.copyWith(markers: updatedMarkers));
    } catch (exception, stackTrace) {
      GetIt.I<Talker>().handle(exception, stackTrace);
    }
  }
}
