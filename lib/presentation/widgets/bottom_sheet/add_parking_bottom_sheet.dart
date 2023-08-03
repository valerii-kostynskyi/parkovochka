import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/add_photo_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/capacity_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/description_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/light_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/navigation_row_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/security_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/traffic_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/user_raiting_item_widget.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/weather_protection_item_widget.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';

class AddParkingBottomSheet extends StatelessWidget {
  final GooglePlaceModel googlePlace;
  final BottomSheetBloc bottomSheetBloc;
  final ParkingBloc parkingBloc;
  final PageController pageController = PageController();

  AddParkingBottomSheet({
    super.key,
    required this.googlePlace,
    required this.bottomSheetBloc,
    required this.parkingBloc,
  }) {
    parkingBloc.parkingRequest.address = googlePlace.address;
    parkingBloc.parkingRequest.googlePlaceId = googlePlace.googlePlaceId;
    parkingBloc.parkingRequest.coordinate = googlePlace.coordinate;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomSheetBloc>.value(value: bottomSheetBloc),
        BlocProvider<ParkingBloc>.value(value: parkingBloc),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: height * 0.9),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SVGIconWidget(
                        icon: 'icon_close',
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (newContext) => SizedBox(
                    height: 200,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        newContext
                            .read<BottomSheetBloc>()
                            .add(ChangeQuestionEvent(page: value));
                      },
                      children: [
                        CapacityItemWidget(controller: pageController),
                        SecurityItemWidget(controller: pageController),
                        LightItemWidget(controller: pageController),
                        TrafficItemWidget(controller: pageController),
                        WetherProtectionItemWidget(controller: pageController),
                        UserRaitingItemWidget(controller: pageController),
                        AddPhotoItemWidget(controller: pageController),
                        DescriptionItemWidget(controller: pageController),
                      ],
                    ),
                  ),
                ),
                NavigationRowWidget(controller: pageController),
                BlocBuilder<BottomSheetBloc, BottomSheetState>(
                  builder: (context, state) {
                    return AnimatedCrossFade(
                      crossFadeState:
                          (state is ButtonVisibilityState && state.showButton)
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 500),
                      firstChild: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: ButtonWidget(
                          onPressed: () {
                            context.read<BottomSheetBloc>().postParking(
                                context.read<ParkingBloc>().parkingRequest);
                          },
                          text: 'add parkovochka'.toUpperCase(),
                          leading: SVGIconWidget(
                            icon: 'icon_plus',
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                      secondChild: const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
