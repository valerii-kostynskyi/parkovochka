import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/bloc/local/local_bloc.dart';
import 'package:parkovochka/bloc/theme/theme_bloc.dart';
import 'package:parkovochka/routes/router.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ParkovochkaApp extends StatelessWidget {
  final _appRouter = AppRouter();

  ParkovochkaApp({Key? key}) : super(key: key);

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
      child: _buildMaterialApp(),
    );
  }

  Widget _buildMaterialApp() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LocaleBloc, Locale>(
          builder: (context, locale) {
            return MaterialApp.router(
              theme: themeState.themeData,
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
    );
  }
}
