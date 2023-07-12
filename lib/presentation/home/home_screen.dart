import 'package:auto_route/auto_route.dart';
import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
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
    GoogleMapController? mapController;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeolocationBloc>(
          create: (BuildContext context) =>
              GeolocationBloc()..add(LoadGeolocationEvent()),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc()..add(LoadParkingListEvent()),
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
        body: BlocBuilder<GeolocationBloc, GeolocationState>(
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
                      position: LatLng(parkingModel.coordinate.latitude,
                          parkingModel.coordinate.longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      ),
                    );
                  }).toSet();

                  markers.addAll(parkingMarkers);

                  return GoogleMap(
                    onTap: (LatLng latLng) {
                      context.read<GeolocationBloc>().add(
                            AddMarkerEvent(
                              Marker(
                                markerId: MarkerId(
                                    '${latLng.latitude}_${latLng.longitude}'),
                                position: latLng,
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueRed,
                                ),
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
                    onMapCreated: (GoogleMapController controllerMap) {
                      mapController = controllerMap;
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
                return Container();
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
                  child: Builder(
                    builder: (context) {
                      return ButtonWidget(
                        onPressed: () {
                          final geolocationState =
                              context.read<GeolocationBloc>().state;
                          if (geolocationState is GeolocationLoadedState) {
                            final currentPosition = geolocationState.position;
                            final marker = Marker(
                              //TODO chek id is it correct
                              markerId: MarkerId(
                                  '${geolocationState.position.latitude}_${geolocationState.position.longitude}'),
                              position: LatLng(
                                currentPosition.latitude,
                                currentPosition.longitude,
                              ),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueAzure,
                              ),
                            );
                            context
                                .read<GeolocationBloc>()
                                .add(AddMarkerEvent(marker));
                          }
                        },
                        text: 'add parkovochka'.toUpperCase(),
                        leading: SVGIconWidget(
                          icon: 'icon_plus',
                          color: lightTheme.iconTheme.color,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
