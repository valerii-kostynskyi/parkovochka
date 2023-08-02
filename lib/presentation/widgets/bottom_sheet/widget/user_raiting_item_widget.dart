import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:parkovochka/util/string_extention.dart';

class UserRaitingItemWidget extends StatefulWidget {
  final PageController controller;

  const UserRaitingItemWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  UserRaitingItemWidgetState createState() => UserRaitingItemWidgetState();
}

class UserRaitingItemWidgetState extends State<UserRaitingItemWidget> {
  double rating = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)
              .translations['rate_the_bicycle_parking_from']!
              .capitalizeFirst(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          rating.toInt().toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Slider(
            value: rating,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: (newValue) {
              setState(
                () {
                  rating = newValue;
                  context.read<ParkingBloc>().add(
                        AddUserRaitingEvent(userRaiting: rating.toInt()),
                      );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
