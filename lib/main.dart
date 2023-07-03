import 'dart:async';

import 'package:bloc_exempl/repository/category_repository.dart';
import 'package:bloc_exempl/repository/impl/category_repository_impl.dart';
import 'package:bloc_exempl/routes/router.dart';
import 'package:bloc_exempl/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'data/data_source/api_data_source.dart';
import 'data/data_source/impl/api_data_source_impl.dart';

void main() {
  final talker = TalkerFlutter.init();

  GetIt.instance.registerSingleton(talker);
  GetIt.instance
      .registerSingleton<ApiDataSource>(ApiDataSourceImpl(talker: talker));
  GetIt.instance.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(
    GetIt.instance.get<ApiDataSource>(),
  ));

//
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(printStateFullData: false),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(BlocExemplApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}

class BlocExemplApp extends StatelessWidget {
  final _appRouter = AppRouter();

  BlocExemplApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(
            GetIt.I<Talker>(),
          ),
        ],
      ),
    );
  }
}
