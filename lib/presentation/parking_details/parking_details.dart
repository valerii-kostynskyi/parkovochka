import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:parkovochka/data/model/parking_model.dart';

@RoutePage()
class ParkingDetails extends StatelessWidget {
  final ParkingModel parkingModel;

  const ParkingDetails({
    super.key,
    required this.parkingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: parkingModel.id, // unique tag for Hero animation
                child: Image.network(parkingModel
                    .photoId), // assuming photoId is a link to the image
              ),
              Text("Address: ${parkingModel.address}"),
              Text("Capacity: ${parkingModel.capacity}"),
              Text("Traffic: ${parkingModel.traffic}"),
              Text("Description: ${parkingModel.description}"),
              Text("Light: ${parkingModel.light ? 'Yes' : 'No'}"),
              Text("Security: ${parkingModel.security ? 'Yes' : 'No'}"),
              // ... add other fields as needed ...
            ],
          ),
        ),
      ),
    );
  }
}
