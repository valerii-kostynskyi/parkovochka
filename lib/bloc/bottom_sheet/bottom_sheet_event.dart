part of 'bottom_sheet_bloc.dart';

abstract class BottomSheetEvent extends Equatable {
  const BottomSheetEvent();

  @override
  List<Object> get props => [];
}

class ShowBottomSheetEvent extends BottomSheetEvent {
  final GooglePlaceModel googlePlace;

  const ShowBottomSheetEvent({required this.googlePlace});

  @override
  List<Object> get props => [googlePlace];
}

class CloseBottomSheetEvent extends BottomSheetEvent {}
