import 'package:auto_route/auto_route.dart';
import 'package:parkovochka/bloc/geolocation/geolocation_bloc.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
import 'package:parkovochka/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  BitmapDescriptor? customIcon;
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  Future<void> loadCustomIconAndMarkers(HomeBloc homeBloc) async {
    customIcon = await _getMarkerIcon();
    final homeState = homeBloc.state;
    if (homeState is LoadedParkingList) {
      final parkingMarkers = homeState.parkingList.map((parkingModel) {
        return Marker(
          markerId: MarkerId(
              '${parkingModel.coordinate.latitude}_${parkingModel.coordinate.longitude}'),
          position: LatLng(parkingModel.coordinate.latitude,
              parkingModel.coordinate.longitude),
          icon: customIcon ?? BitmapDescriptor.defaultMarker,
        );
      }).toSet();
      setState(() {
        markers.addAll(parkingMarkers);
      });
    }
  }

  Future<BitmapDescriptor> _getMarkerIcon() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/icons/icon_parkovochka.png', 130);
    return BitmapDescriptor.fromBytes(markerIcon);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

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
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  loadCustomIconAndMarkers(homeBloc);

                  return GoogleMap(
                    onTap: (LatLng latLng) {
                      mapController?.animateCamera(
                        CameraUpdate.newLatLng(latLng),
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
                _addParkovochka(),
                const SizedBox(width: 8),
                _currentLocation(mapController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _currentLocation(GoogleMapController? mapController) {
    return Expanded(
      child: Builder(
        builder: (context) {
          return ButtonWidget(
            onPressed: () {
              mapController?.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(
                    48.621025,
                    22.288229,
                  ),
                ),
              );
            },
            text: 'current location'.toUpperCase(),
            leading: SVGIconWidget(
              icon: 'icon_location',
              color: lightTheme.iconTheme.color,
            ),
          );
        },
      ),
    );
  }

  Widget _addParkovochka() {
    return Expanded(
      child: Builder(
        builder: (context) {
          return ButtonWidget(
            onPressed: () {
              final geolocationState = context.read<GeolocationBloc>().state;
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
                context.read<GeolocationBloc>().add(AddMarkerEvent(marker));
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
    );
  }
}
