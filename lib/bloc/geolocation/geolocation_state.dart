part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {}

class GeolocationInitialState extends GeolocationState {
  @override
  List<Object?> get props => [];
}

class GeolocationLoadedState extends GeolocationState {
  final Position position;
  final List<Marker> markers;

  GeolocationLoadedState({
    required this.position,
    List<Marker>? markers,
  }) : markers = markers ?? [];

  GeolocationLoadedState copyWith({
    Position? position,
    List<Marker>? markers,
  }) {
    return GeolocationLoadedState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [position, markers];
}

class GeolocationErrorState extends GeolocationState {
  final Object? exeption;

  GeolocationErrorState({required this.exeption});

  @override
  List<Object?> get props => [exeption];
}
