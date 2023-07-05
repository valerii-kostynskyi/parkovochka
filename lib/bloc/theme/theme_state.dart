part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {}

class ThemeStateInitial extends ThemeState {
  ThemeStateInitial(ThemeData lightTheme);

  @override
  List<Object> get props => [];
}


// class ThemeState {
//   final ThemeData themeData;

//   ThemeState(
//     this.themeData,
//   );
// }
