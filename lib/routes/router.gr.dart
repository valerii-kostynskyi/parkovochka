// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ParkingDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ParkingDetailsArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ParkingDetails(
          key: args.key,
          parkingModel: args.parkingModel,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ParkingDetails]
class ParkingDetailsRoute extends PageRouteInfo<ParkingDetailsArgs> {
  ParkingDetailsRoute({
    Key? key,
    required ParkingModel parkingModel,
    List<PageRouteInfo>? children,
  }) : super(
          ParkingDetailsRoute.name,
          args: ParkingDetailsArgs(
            key: key,
            parkingModel: parkingModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ParkingDetails';

  static const PageInfo<ParkingDetailsArgs> page =
      PageInfo<ParkingDetailsArgs>(name);
}

class ParkingDetailsArgs {
  const ParkingDetailsArgs({
    this.key,
    required this.parkingModel,
  });

  final Key? key;

  final ParkingModel parkingModel;

  @override
  String toString() {
    return 'ParkingDetailsArgs{key: $key, parkingModel: $parkingModel}';
  }
}
