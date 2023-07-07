import 'dart:async';

import 'package:parkovochka/repository/geolocation_repository.dart';
import 'package:parkovochka/repository/impl/geolocation_repository_impl.dart';
import 'package:parkovochka/routes/router.dart';
import 'package:parkovochka/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'bloc/theme/theme_bloc.dart';
import 'data/data_source/api_data_source.dart';
import 'data/data_source/impl/api_data_source_impl.dart';

void main() {
  final talker = TalkerFlutter.init();

  GetIt.instance.registerSingleton(talker);
  GetIt.instance
      .registerSingleton<ApiDataSource>(ApiDataSourceImpl(talker: talker));
  GetIt.instance.registerSingleton<GeolocationRepository>(
      GeolocationRepositoryImpl(ApiDataSourceImpl(talker: talker)));

//
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
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [
                TalkerRouteObserver(GetIt.I<Talker>()),
              ],
            ),
          );
        },
      ),
    );
  }
}
