import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/util/langs/app_locale.dart';

part 'local_event.dart';
part 'local_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, ApplicationLocale> {
  LocaleBloc(ApplicationLocale initialState) : super(initialState) {
    on<ChangeLocaleEvent>((event, emit) {
      emit(event.locale);
    });
  }
}