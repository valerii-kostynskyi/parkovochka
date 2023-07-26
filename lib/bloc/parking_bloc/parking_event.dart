part of 'parking_bloc.dart';

abstract class ParkingEvent extends Equatable {}

class AddCapacityEvent extends ParkingEvent {
  final String capacity;

  AddCapacityEvent({
    required this.capacity,
  });

  @override
  List<Object?> get props => [capacity];
}

class AddTrafficEvent extends ParkingEvent {
  final String traffic;

  AddTrafficEvent({
    required this.traffic,
  });
  @override
  List<Object?> get props => [traffic];
}

class AddSecurityEvent extends ParkingEvent {
  final bool security;

  AddSecurityEvent({
    required this.security,
  });

  @override
  List<Object?> get props => [security];
}

class AddLightEvent extends ParkingEvent {
  final bool light;

  AddLightEvent({
    required this.light,
  });

  @override
  List<Object?> get props => [light];
}

class AddWetherProtectionEvent extends ParkingEvent {
  final bool wetherProtection;

  AddWetherProtectionEvent({
    required this.wetherProtection,
  });

  @override
  List<Object?> get props => [wetherProtection];
}

class AddUserRaitingEvent extends ParkingEvent {
  final int userRaiting;

  AddUserRaitingEvent({
    required this.userRaiting,
  });

  @override
  List<Object?> get props => [userRaiting];
}

class ShowButtonEvent extends ParkingEvent {
  final bool showButton;

  ShowButtonEvent({required this.showButton});

  @override
  List<Object> get props => [showButton];
}
