import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'local_event.dart';
part 'local_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, Locale> {
  LocaleBloc(Locale initialState) : super(initialState) {
    on<ChangeLocaleEvent>((event, emit) {
      emit(event.locale);
    });
  }
}
