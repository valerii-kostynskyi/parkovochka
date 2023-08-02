import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';

import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/drawer/app_drawer.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/presentation/home/widget/bottom_sheet_widget.dart';
import 'package:parkovochka/presentation/home/widget/google_map_widget.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:parkovochka/util/string_extention.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc()..add(LoadParkingListEvent()),
        ),
        BlocProvider<BottomSheetBloc>(
          create: (BuildContext context) => BottomSheetBloc(),
        ),
        BlocProvider<GeolocationBloc>(
          create: (BuildContext context) => GeolocationBloc(
            bottomSheetBloc: context.read<BottomSheetBloc>(),
          )..add(LoadGeolocationEvent()),
        ),
      ],
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: SVGIconWidget(
            height: 30,
            icon: 'parkovochka_logo',
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is LoadedParkingList) {
                  return const GoogleMapWidget();
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is LoadedParkingList ||
                    state is ShowBottomSheetState) {
                  return const BottomSheetWidget();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: BlocBuilder<BottomSheetBloc, BottomSheetState>(
          builder: (context, state) {
            return AnimatedCrossFade(
              crossFadeState: (state is ShowBottomBarState)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 500),
              secondChild: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                height: 40,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)
                        .translations['please_choose_veloparking_location']!
                        .capitalizeFirst(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              firstChild: BottomAppBar(
                color: Theme.of(context).colorScheme.error.withOpacity(0),
                elevation: 0,
                padding: const EdgeInsets.only(bottom: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Builder(
                      builder: (context) {
                        return ButtonWidget(
                          onPressed: () {
                            if (state is ShowBottomBarState) {
                              context.read<BottomSheetBloc>().add(
                                    ShowBottomSheetEvent(
                                      googlePlace: state.googlePlace,
                                    ),
                                  );
                            }
                          },
                          text: AppLocalizations.of(context)
                              .translations['add_parkovochka']!
                              .toUpperCase(),
                          leading: SVGIconWidget(
                            icon: 'icon_plus',
                            color: Theme.of(context).iconTheme.color,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
