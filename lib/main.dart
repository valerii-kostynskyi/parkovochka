import 'dart:async';

import 'package:parkovochka/bloc/local/bloc/local_bloc.dart';
import 'package:parkovochka/domain/geolocation_repository.dart';
import 'package:parkovochka/domain/impl/geolocation_repository_impl.dart';
import 'package:parkovochka/domain/impl/parking_repository_impl.dart';
import 'package:parkovochka/domain/parking_repository.dart';
import 'package:parkovochka/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'bloc/theme/theme_bloc.dart';
import 'data/data_source/api_data_source.dart';
import 'data/data_source/impl/api_data_source_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  final talker = TalkerFlutter.init();

  GetIt.instance.registerSingleton(talker);
  GetIt.instance
      .registerSingleton<ApiDataSource>(ApiDataSourceImpl(talker: talker));
  GetIt.instance.registerSingleton<GeolocationRepository>(
      GeolocationRepositoryImpl(ApiDataSourceImpl(talker: talker)));
  GetIt.instance.registerSingleton<ParkingRepository>(
      ParkingRepositoryImpl(ApiDataSourceImpl(talker: talker)));

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(printStateFullData: false),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(ParkovochkaApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}

class ParkovochkaApp extends StatelessWidget {
  final _appRouter = AppRouter();

  ParkovochkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<LocaleBloc>(
          create: (BuildContext context) => LocaleBloc(
            const Locale('en', 'US'),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleBloc, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                theme: _getTheme(themeState),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('uk', 'UA'),
                ],
                locale: locale,
                routerConfig: _appRouter.config(
                  navigatorObservers: () => [
                    TalkerRouteObserver(GetIt.I<Talker>()),
                  ],
                ),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }

  ThemeData _getTheme(ThemeState state) {
    return state.themeData;
  }
}
