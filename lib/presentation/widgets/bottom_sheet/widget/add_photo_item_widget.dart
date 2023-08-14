import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_state.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:parkovochka/util/string_extention.dart';

class AddPhotoItemWidget extends StatelessWidget {
  final PageController controller;

  const AddPhotoItemWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<ParkingBloc, ParkingState>(builder: (context, state) {
        return Column(
          children: [
            Text(
              AppLocalizations.of(context)
                  .translations['please_take_a_photo_of_the_bike_park']!
                  .capitalizeFirst(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            ButtonWidget(
              text: AppLocalizations.of(context)
                  .translations['take_a_photo']!
                  .capitalizeFirst(),
              onPressed: () {
                context.read<ParkingBloc>().add(PhotoEvent(ImageSource.camera));
              },
            ),
            const SizedBox(height: 8),
            ButtonWidget(
              text: AppLocalizations.of(context)
                  .translations['upload_a_photo']!
                  .capitalizeFirst(),
              onPressed: () {
                context
                    .read<ParkingBloc>()
                    .add(PhotoEvent(ImageSource.gallery));
              },
            ),
          ],
        );
      }),
    );
  }
}
