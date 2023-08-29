import 'package:flutter/material.dart';
import 'package:parkovochka/data/model/parking_model.dart';

class ParkingDetails extends StatelessWidget {
  final ParkingModel parkingModel;

  const ParkingDetails({
    Key? key,
    required this.parkingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero(
            //   tag: parkingModel.id,
            //   child: Image.network(parkingModel.photoId),
            // ),
            Text("Address: ${parkingModel.address}"),
            Text("Capacity: ${parkingModel.capacity}"),
            Text("Traffic: ${parkingModel.traffic}"),
            if (parkingModel.description.isNotEmpty)
              Text("Description: ${parkingModel.description}"),
            Text("Light: ${parkingModel.light ? 'Yes' : 'No'}"),
            Text("Security: ${parkingModel.security ? 'Yes' : 'No'}"),
          ],
        ),
      ),
    );
  }
}
