import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/style/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: lightTheme)) {
    on<ThemeToggled>(_toggletheme);
  }

  void _toggletheme(ThemeToggled event, Emitter<ThemeState> emit) {
    if (state.themeData == lightTheme) {
      emit(ThemeState(themeData: darkTheme));
    } else {
      emit(ThemeState(themeData: lightTheme));
    }
  }
}
