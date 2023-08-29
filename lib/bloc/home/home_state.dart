part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class LoadingParkingList extends HomeState {}

class LoadedParkingList extends HomeState {
  final List<ParkingModel> parkingList;
  final bool showButton;

  const LoadedParkingList({
    required this.parkingList,
    this.showButton = false,
  });

  @override
  List<Object> get props => [parkingList, showButton];
}

class ParkingListErrorState extends HomeState {
  final Object exception;

  const ParkingListErrorState({required this.exception});

  @override
  List<Object> get props => [exception];
}
