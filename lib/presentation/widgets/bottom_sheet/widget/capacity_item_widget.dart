import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
import 'package:parkovochka/data/model/response/capacity_respone.dart';
import 'package:parkovochka/domain/parking_repository.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/choice_item_button.dart';

class CapacityItemWidget extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
  final ParkingRepository parkingRepository =
      GetIt.instance.get<ParkingRepository>();

  CapacityItemWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Оцінка кількості місць для паркування велосипедів:'),
        ),
        const SizedBox(height: 24),
        FutureBuilder<List<CapacityResponse>>(
          future: parkingRepository.getCapacity(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => ValueListenableBuilder<int>(
                      valueListenable: selectedIndexNotifier,
                      builder: (context, selectedIndex, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ChoiceItemButton(
                            index: index,
                            onTap: (index) {
                              selectedIndexNotifier.value = index;
                              context.read<ParkingBloc>().add(
                                    AddCapacityEvent(
                                      capacity: snapshot.data![index].value,
                                    ),
                                  );
                            },
                            selectedIndexNotifier: selectedIndexNotifier,
                            title: snapshot.data![index].name,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
