import 'package:equatable/equatable.dart';
import 'package:parkovochka/data/model/request/parking_request.dart';

abstract class ParkingState extends Equatable {
  @override
  List<Object> get props => [];
}

class ParkingStateInitial extends ParkingState {}

class ParkingPostedSuccess extends ParkingState {}

class ParkingInitial extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingLoading extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingSuccess extends ParkingState {
  final ParkingRequest parkingRequest;

  ParkingSuccess({required this.parkingRequest});

  @override
  List<Object> get props => [parkingRequest];
}

class ParkingFailure extends ParkingState {
  final String error;

  ParkingFailure({required this.error});

  @override
  List<Object> get props => [error];
}
