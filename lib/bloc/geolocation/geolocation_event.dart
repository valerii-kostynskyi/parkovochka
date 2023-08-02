part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  List<Object> get props => [];
}

class LoadGeolocationEvent extends GeolocationEvent {}


class AddMarkerEvent extends GeolocationEvent {
  final Marker marker;

 const AddMarkerEvent(this.marker);

  @override
  List<Object> get props => [marker];
}

