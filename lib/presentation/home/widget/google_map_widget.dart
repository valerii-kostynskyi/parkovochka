import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/bloc/theme/theme_bloc.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/presentation/parking_details/parking_details.dart';
import 'package:parkovochka/routes/router.dart';
import 'package:parkovochka/style/theme.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget>
    with WidgetsBindingObserver {
  BitmapDescriptor? myIcon;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(10, 20)),
            'assets/icons/park_logo.png')
        .then((onValue) {
      setState(() {
        myIcon = onValue;
      });
    });
  }

  @override
  void didChangePlatformBrightness() {
    _setMapStyle(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        _setMapStyle(context);
        return BlocBuilder<GeolocationBloc, GeolocationState>(
          builder: (context, state) {
            if (state is GeolocationLoadedState) {
              final markers = state.markers.toSet();
              return BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, homeState) {
                if (homeState is LoadedParkingList) {
                  final parkingMarkers =
                      homeState.parkingList.map((parkingModel) {
                    return Marker(
                        markerId: MarkerId(
                            '${parkingModel.coordinate.latitude}_${parkingModel.coordinate.longitude}'),
                        position: LatLng(
                          parkingModel.coordinate.latitude,
                          parkingModel.coordinate.longitude,
                        ),
                        onTap: () {
                          context.router.push(
                            ParkingDetailsRoute(parkingModel: parkingModel),
                          );
                        },
                        icon: myIcon ?? BitmapDescriptor.defaultMarker);
                  }).toSet();

                  markers.addAll(parkingMarkers);

                  return GoogleMap(
                    onTap: (LatLng latLng) {
                      context.read<GeolocationBloc>().add(
                            AddMarkerEvent(
                              Marker(
                                markerId: MarkerId(
                                  '${latLng.latitude}_${latLng.longitude}',
                                ),
                                position: latLng,
                                icon: myIcon!,
                              ),
                            ),
                          );
                    },
                    cameraTargetBounds: CameraTargetBounds.unbounded,
                    markers: markers,
                    mapType: MapType.normal,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    mapToolbarEnabled: true,
                    onMapCreated: (GoogleMapController controller) async {
                      mapController = controller;
                      await _setMapStyle(context);
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        state.position.latitude,
                        state.position.longitude,
                      ),
                      zoom: 17,
                    ),
                  );
                }
                return const SizedBox();
              });
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
        );
      },
    );
  }

  Future<void> _setMapStyle(BuildContext context) async {
    if (mapController != null) {
      final themeState = BlocProvider.of<ThemeBloc>(context).state;
      String style;
      if (themeState.themeData == lightTheme) {
        style = await rootBundle.loadString('assets/map_style_light.json');
      } else {
        style = await rootBundle.loadString('assets/map_style_dark.json');
      }
      mapController!.setMapStyle(style);
    }
  }
}
