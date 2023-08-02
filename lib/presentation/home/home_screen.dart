import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';

import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/drawer/app_drawer.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/presentation/home/widget/bottom_sheet_widget.dart';
import 'package:parkovochka/presentation/home/widget/google_map_widget.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
import 'package:parkovochka/style/theme.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';

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
        drawer: AppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const SVGIconWidget(
            height: 30,
            icon: 'parkovochka_logo',
          ),
          // actions: [
          //   TextButton(
          //       onPressed: () => context.read<ThemeBloc>().add(ThemeToggled()),
          //       child: Text('Change theme'))
          // ],
        ),
        body: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                // ignore: unused_local_variable
                GoogleMapController? mapController;
                if (state is LoadedParkingList) {
                  return GoogleMapWidget(
                    onMapCreated: (controller) => mapController = controller,
                  );
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
                  color: lightTheme.colorScheme.primary,
                ),
                height: 40,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)
                        .translations['please_choose_veloparking_location']!,
                  ),
                ),
              ),
              firstChild: BottomAppBar(
                color: lightTheme.colorScheme.error.withOpacity(0),
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
                          text: 'додати parkovochka'.toUpperCase(),
                          leading: SVGIconWidget(
                            icon: 'icon_plus',
                            color: lightTheme.iconTheme.color,
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
