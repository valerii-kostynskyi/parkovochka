import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/custom_icon_button.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:parkovochka/util/string_extention.dart';

class WetherProtectionItemWidget extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<bool> likeSelected;
  final ValueNotifier<bool> dislikeSelected;

  WetherProtectionItemWidget({
    Key? key,
    required this.controller,
  })  : likeSelected = ValueNotifier<bool>(true),
        dislikeSelected = ValueNotifier<bool>(false),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)
                .translations[
                    'does_the_bicycle_parking_have_weather_protection']!
                .capitalizeFirst(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButton(
                icon: 'assets/icons/like.svg',
                selectedIcon: 'assets/icons/liked.svg',
                selected: likeSelected,
                fillIcon: true,
                onPressed: () {
                  likeSelected.value = true;
                  dislikeSelected.value = false;
                  context.read<ParkingBloc>().add(
                        AddWetherProtectionEvent(wetherProtection: true),
                      );
                },
              ),
              const SizedBox(width: 16),
              CustomIconButton(
                icon: 'assets/icons/dislike.svg',
                selectedIcon: 'assets/icons/disliked.svg',
                selected: dislikeSelected,
                fillIcon: true,
                onPressed: () {
                  dislikeSelected.value = true;
                  likeSelected.value = false;
                  context.read<ParkingBloc>().add(
                        AddWetherProtectionEvent(wetherProtection: false),
                      );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
