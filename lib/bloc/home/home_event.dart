part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadParkingListEvent extends HomeEvent {}

class ChangeButtonVisibilityHomeEvent extends HomeEvent {
  final bool showButton;

  const ChangeButtonVisibilityHomeEvent({
    this.showButton = false,
  });

  @override
  List<Object> get props => [showButton];
}
