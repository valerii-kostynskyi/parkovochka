import 'package:auto_route/auto_route.dart';
import 'package:parkovochka/presentation/home/bloc/home_bloc.dart';
import 'package:parkovochka/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'parkovochka'.toUpperCase(),
          ),
        ),
        body: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(48.0, 31.0),
            zoom: 10,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: lightTheme.colorScheme.tertiaryContainer,
          splashColor: lightTheme.colorScheme.background,
          isExtended: true,
          elevation: 2,
          label: Text('add parkovochka'.toUpperCase()),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
