part of 'bottom_sheet_bloc.dart';

abstract class BottomSheetEvent extends Equatable {
  const BottomSheetEvent();

  @override
  List<Object> get props => [];
}

// class ShowBottomSheetEvent extends BottomSheetEvent {
//   final GooglePlaceModel googlePlace;

//   const ShowBottomSheetEvent({required this.googlePlace});

//   @override
//   List<Object> get props => [googlePlace];
// }

// class CloseBottomSheetEvent extends BottomSheetEvent {}

class ChangeQuestionEvent extends BottomSheetEvent {
  final int page;
  const ChangeQuestionEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class ChangeButtonVisibilityEvent extends BottomSheetEvent {
  final bool showButton;

  const ChangeButtonVisibilityEvent({
    this.showButton = false,
  });

  @override
  List<Object> get props => [showButton];
}

class ShowBottomBarEvent extends BottomSheetEvent {
    final GooglePlaceModel googlePlace;

  const ShowBottomBarEvent({required this.googlePlace});

  @override
  List<Object> get props => [googlePlace];
}

class HideBottomBarEvent extends BottomSheetEvent {}
