import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/custom_icon_button.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:parkovochka/util/string_extention.dart';

class LightItemWidget extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<bool> likeSelected;

  LightItemWidget({
    Key? key,
    required this.controller,
  })  : likeSelected = ValueNotifier<bool>(true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)
                .translations['does_the_bicycle_parking_have_lighting']!
                .capitalizeFirst(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Expanded(
          child: CustomIconButton(
            icon: 'assets/icons/light_off.svg',
            selectedIcon: 'assets/icons/light_on.svg',
            selected: likeSelected,
            onPressed: () {
              likeSelected.value = !likeSelected.value;
              context.read<ParkingBloc>().add(
                    AddLightEvent(light: likeSelected.value),
                  );
            },
          ),
        ),
      ],
    );
  }
}
