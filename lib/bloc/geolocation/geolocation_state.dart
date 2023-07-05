part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {}

class GeolocationInitialState extends GeolocationState {
  @override
  List<Object?> get props => [];
}

class GeolocationLoadedState extends GeolocationState {
  final Position position;

  GeolocationLoadedState({
    required this.position,
  });
  @override
  List<Object> get props => [position];
}

class GeolocationErrorState extends GeolocationState {
  final Object? exeption;

  GeolocationErrorState({required this.exeption});

  @override
  List<Object?> get props => [exeption];
}
