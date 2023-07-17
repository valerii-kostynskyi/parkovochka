import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';

import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/presentation/home/widget/bottom_sheet_widget.dart';
import 'package:parkovochka/presentation/home/widget/google_map_widget.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
import 'package:parkovochka/style/theme.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleMapController? mapController;
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc()..add(LoadParkingListEvent()),
        ),
        BlocProvider<BottomSheetBloc>(
          create: (BuildContext context) =>
              BottomSheetBloc(homeBloc: HomeBloc()),
        ),
        BlocProvider<GeolocationBloc>(
          create: (BuildContext context) => GeolocationBloc(
            bottomSheetBloc: context.read<BottomSheetBloc>(),
          )..add(LoadGeolocationEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const SVGIconWidget(
            height: 30,
            icon: 'parkovochka_logo',
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
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
        bottomNavigationBar: BottomAppBar(
          color: lightTheme.colorScheme.error.withOpacity(0),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: Builder(
                builder: (context) {
                  return ButtonWidget(
                    onPressed: () {
                      final geolocationState =
                          context.read<GeolocationBloc>().state;
                      if (geolocationState is GeolocationLoadedState) {
                        final currentPosition = geolocationState.position;
                        mapController?.animateCamera(
                          CameraUpdate.newLatLng(
                            LatLng(
                              48.621025,
                              22.288229,
                            ),
                            //current position
                            // LatLng(
                            //   currentPosition.latitude,
                            //   currentPosition.longitude,
                            // ),
                          ),
                        );
                      }
                    },
                    text: 'current location'.toUpperCase(),
                    leading: SVGIconWidget(
                      icon: 'icon_location',
                      color: lightTheme.iconTheme.color,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
