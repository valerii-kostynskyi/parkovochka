// Dart imports
import 'dart:async';

// Package imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:parkovochka/presentation/parkovochka/parkovochka_app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Project imports
import 'package:parkovochka/domain/geolocation_repository.dart';
import 'package:parkovochka/domain/impl/geolocation_repository_impl.dart';
import 'package:parkovochka/domain/impl/parking_repository_impl.dart';
import 'package:parkovochka/domain/parking_repository.dart';
import 'data/data_source/api_data_source.dart';
import 'data/data_source/impl/api_data_source_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  _setupDependencies();

  Bloc.observer = TalkerBlocObserver(
    talker: GetIt.I<Talker>(),
    settings: const TalkerBlocLoggerSettings(printStateFullData: false),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(ParkovochkaApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}

void _setupDependencies() {
  final talker = TalkerFlutter.init();

  GetIt.instance.registerSingleton(talker);
  GetIt.instance
      .registerSingleton<ApiDataSource>(ApiDataSourceImpl(talker: talker));
  GetIt.instance.registerSingleton<GeolocationRepository>(
      GeolocationRepositoryImpl(ApiDataSourceImpl(talker: talker)));
  GetIt.instance.registerSingleton<ParkingRepository>(
      ParkingRepositoryImpl(ApiDataSourceImpl(talker: talker)));
}
