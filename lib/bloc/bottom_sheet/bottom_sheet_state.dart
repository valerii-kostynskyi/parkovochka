part of 'bottom_sheet_bloc.dart';

abstract class BottomSheetState extends Equatable {
  const BottomSheetState();

  @override
  List<Object> get props => [];
}

class BottomSheetInitial extends BottomSheetState {}

// class ShowBottomSheetState extends BottomSheetState {
//   final GooglePlaceModel googlePlace;

//   const ShowBottomSheetState({required this.googlePlace});

//   @override
//   List<Object> get props => [googlePlace];
// }

// class HideBottomSheetState extends BottomSheetState {}

class BottomSheetErrorState extends BottomSheetState {
  final Object exception;

  const BottomSheetErrorState({required this.exception});

  @override
  List<Object> get props => [exception];
}

class ChangeQuestionPageState extends BottomSheetState {
  final int page;

  const ChangeQuestionPageState({this.page = 0});

  @override
  List<Object> get props => [page];
}

class ButtonVisibilityState extends BottomSheetState {
  final bool showButton;

  const ButtonVisibilityState({this.showButton = false});

  @override
  List<Object> get props => [showButton];
}


// class ShowBottomBarState extends BottomSheetState {
//     final GooglePlaceModel googlePlace;

//   const ShowBottomBarState({required this.googlePlace});

//   @override
//   List<Object> get props => [googlePlace];
// }

// class HideBottomBarState extends BottomSheetState {}

