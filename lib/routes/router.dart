import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/presentation/home/home_screen.dart';
import 'package:parkovochka/presentation/parking_details/parking_details.dart';

part 'router.gr.dart';

// flutter packages pub run build_runner build

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: ParkingDetailsRoute.page, path: '/parking_detail'),
      ];
}
