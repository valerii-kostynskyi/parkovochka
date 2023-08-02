import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';

class GoogleMapWidget extends StatefulWidget {
  final Function(GoogleMapController) onMapCreated;

  const GoogleMapWidget({
    super.key,
    required this.onMapCreated,
  });

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget> {
  BitmapDescriptor? myIcon;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    return BlocBuilder<GeolocationBloc, GeolocationState>(
      builder: (context, state) {
        if (state is GeolocationLoadedState) {
          final markers = state.markers.toSet();
          return BlocBuilder<HomeBloc, HomeState>(
              builder: (context, homeState) {
            if (homeState is LoadedParkingList) {
              final parkingMarkers = homeState.parkingList.map((parkingModel) {
                return Marker(
                    markerId: MarkerId(
                        '${parkingModel.coordinate.latitude}_${parkingModel.coordinate.longitude}'),
                    position: LatLng(
                      parkingModel.coordinate.latitude,
                      parkingModel.coordinate.longitude,
                    ),
                    icon: myIcon!);
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
                onMapCreated: widget.onMapCreated,
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
    );
  }
}
