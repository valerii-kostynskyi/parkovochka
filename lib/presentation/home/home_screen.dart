import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
import 'package:parkovochka/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final geolocationBloc = GeolocationBloc()..add(LoadGeolocationEvent());
    return BlocProvider(
      create: (context) => geolocationBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'parkovochka'.toUpperCase(),
          ),
        ),
        body: BlocBuilder<GeolocationBloc, GeolocationState>(
          builder: (context, state) {
            if (state is GeolocationInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GeolocationLoadedState) {
              return GoogleMap(
                cameraTargetBounds: CameraTargetBounds.unbounded,
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                mapToolbarEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    state.position.latitude,
                    state.position.longitude,
                  ),
                  zoom: 17,
                ),
              );
            }
            if (state is GeolocationErrorState) {
              return Center(
                child: Text(state.exeption?.toString() ?? 'Error'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          color: lightTheme.colorScheme.error.withOpacity(0),
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => geolocationBloc.add(LoadGeolocationEvent()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: lightTheme.colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SVGIconWidget(icon: 'icon_close'),
                          const SizedBox(height: 6),
                          Text('add parkovochka'.toUpperCase()),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: lightTheme.colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: Platform.isAndroid
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.end,
                        children: [
                          const SVGIconWidget(icon: 'icon_location'),
                          const SizedBox(height: 6),
                          Text('current location'.toUpperCase()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
