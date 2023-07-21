import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';
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
import 'package:parkovochka/style/theme.dart';

class AddParkingBottomSheet extends StatelessWidget {
  final GooglePlaceModel googlePlace;
  final PageController pageController = PageController();

  AddParkingBottomSheet({
    super.key,
    required this.googlePlace,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => BottomSheetBloc(),
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
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
                SizedBox(
                  height: 200,
                  child: PageView(
                    controller: pageController,
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
                NavigationRowWidget(controller: pageController),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Builder(
                      builder: (context) {
                        return ButtonWidget(
                          onPressed: () {
                            context
                                .read<BottomSheetBloc>()
                                .postParking(googlePlace);
                          },
                          text: 'add parkovochka'.toUpperCase(),
                          leading: SVGIconWidget(
                            icon: 'icon_plus',
                            color: lightTheme.iconTheme.color,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
