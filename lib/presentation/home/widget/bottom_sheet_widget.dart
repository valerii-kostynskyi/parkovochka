// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';
// import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';
// import 'package:parkovochka/presentation/widgets/bottom_sheet/add_parking_bottom_sheet.dart';

// class BottomSheetWidget extends StatelessWidget {
//   const BottomSheetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final BottomSheetBloc bottomSheetBloc = context.read<BottomSheetBloc>();
//     final ParkingBloc parkingBloc = ParkingBloc();
//     return BlocListener<BottomSheetBloc, BottomSheetState>(
//       bloc: bottomSheetBloc,
//       listener: (context, state) {
//         if (state is ShowBottomSheetState) {
//           // showModalBottomSheet(
//           //   context: context,
//           //   builder: (context) => AddParkingBottomSheet(
//           //     googlePlace: state.googlePlace,
//           //     bottomSheetBloc: bottomSheetBloc,
//           //     parkingBloc: parkingBloc,
//           //   ),
//           //   isScrollControlled: true,
//           //   shape: const RoundedRectangleBorder(
//           //     borderRadius: BorderRadius.only(
//           //       topLeft: Radius.circular(16),
//           //       topRight: Radius.circular(16),
//           //     ),
//           //   ),
//           //   backgroundColor: Colors.transparent,
//           //   clipBehavior: Clip.antiAliasWithSaveLayer,
//           //   elevation: 0,
//           //   useRootNavigator: true,
//           // );
//         } else if (state is HideBottomSheetState) {
//           if (Navigator.canPop(context)) {
//             Navigator.pop(context);
//           }
//         }
//       },
//       child: const SizedBox.shrink(),
//     );
//   }
// }
