part of 'local_bloc.dart';

abstract class LocaleEvent {}

class ChangeLocaleEvent extends LocaleEvent {
  final ApplicationLocale locale;

  ChangeLocaleEvent(this.locale);
}