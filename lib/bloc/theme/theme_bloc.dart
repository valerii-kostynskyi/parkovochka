import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/style/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeStateInitial(lightTheme)) {
    on<ThemeToggled>(_toggletheme);
  }

  _toggletheme(ThemeToggled ecent, Emitter<ThemeState> emit) {

  }
}
