part of 'local_bloc.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();

  @override
  List<Object> get props => [];
}

class LocaleInitial extends LocaleState {}

class LocaleLoaded extends LocaleState {
  final ApplicationLocale locale;

  const LocaleLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}
