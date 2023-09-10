import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_state.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/data/model/request/parking_request.dart';
import 'package:parkovochka/domain/geolocation_repository.dart';
import 'package:parkovochka/domain/parking_repository.dart';

part 'parking_event.dart';

class ParkingBloc extends Bloc<ParkingEvent, ParkingState> {
  final ParkingRepository parkingRepository =
      GetIt.instance.get<ParkingRepository>();
  final GeolocationRepository geolocationRepository =
      GetIt.instance.get<GeolocationRepository>();
  ParkingRequest parkingRequest = ParkingRequest.withDefaultValues();

  bool showButton = false;

  ParkingBloc() : super(ParkingStateInitial()) {
    on<AddCapacityEvent>(addCapacity);
    on<AddSecurityEvent>(addSecurity);
    on<AddLightEvent>(addLight);
    on<AddTrafficEvent>(addTraffic);
    on<AddWetherProtectionEvent>(addWetherProtection);
    on<AddUserRaitingEvent>(addUserRaiting);
    on<ShowButtonEvent>(showButtonFunc);
    on<FetchPlaceModelEvent>(fetchPlaceModel);
    on<PostParkingEvent>(postParking);
    on<PhotoEvent>(processPhoto);
  }

  void fetchPlaceModel(FetchPlaceModelEvent event, Emitter<ParkingState> emit) {
    emit(ParkingLoading());
    GooglePlaceModel? placeModel = geolocationRepository.getPlaceModel();
    if (placeModel != null) {
      parkingRequest.address = placeModel.address;
      parkingRequest.googlePlaceId = placeModel.googlePlaceId;
      parkingRequest.coordinate = placeModel.coordinate;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } else {
      emit(ParkingFailure(error: "Failed to fetch place model"));
    }
  }

  void addCapacity(AddCapacityEvent event, Emitter<ParkingState> emit) {
    try {
      parkingRequest.capacity = event.capacity;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } catch (e) {
      emit(ParkingFailure(error: e.toString()));
    }
  }

  void addTraffic(AddTrafficEvent event, Emitter<ParkingState> emit) {
    try {
      parkingRequest.traffic = event.traffic;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } catch (e) {
      emit(ParkingFailure(error: e.toString()));
    }
  }

  void addSecurity(AddSecurityEvent event, Emitter<ParkingState> emit) {
    try {
      parkingRequest.security = event.security;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } catch (e) {
      emit(ParkingFailure(error: e.toString()));
    }
  }

  void addLight(AddLightEvent event, Emitter<ParkingState> emit) {
    try {
      parkingRequest.light = event.light;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } catch (e) {
      emit(ParkingFailure(error: e.toString()));
    }
  }

  void addWetherProtection(
      AddWetherProtectionEvent event, Emitter<ParkingState> emit) {
    try {
      parkingRequest.weatherProtection = event.wetherProtection;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } catch (e) {
      emit(ParkingFailure(error: e.toString()));
    }
  }

  void addUserRaiting(AddUserRaitingEvent event, Emitter<ParkingState> emit) {
    try {
      parkingRequest.userRating = event.userRaiting;
      emit(ParkingSuccess(parkingRequest: parkingRequest));
    } catch (e) {
      emit(ParkingFailure(error: e.toString()));
    }
  }

  void showButtonFunc(ShowButtonEvent event, Emitter<ParkingState> emit) {
    showButton = event.showButton;
  }

  Future<void> postParking(
      PostParkingEvent event, Emitter<ParkingState> emit) async {
    try {
      if (parkingRequest.isValid()) {
        bool result =
            await parkingRepository.postParking(parking: parkingRequest);
        if (result) {
          emit(ParkingPostedSuccess());
        } else {
          emit(ParkingFailure(error: "Failed to post parking."));
        }
      } else {
        emit(ParkingFailure(error: "invalide parking, we can show exeption"));
      }
    } catch (error) {
      emit(ParkingFailure(error: error.toString()));
    }
  }


//TODO in proccess 
  Future<void> processPhoto(
      PhotoEvent event, Emitter<ParkingState> emit) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: event.source);
      print(event.source == ImageSource.camera ? 'take Photo' : 'add photo');

      if (pickedFile != null) {
        print(
            '${event.source == ImageSource.camera ? 'take Photo' : 'add photo'} pickedFile ${pickedFile.path}');

        final XFile? compressedFile =
            await FlutterImageCompress.compressAndGetFile(
          pickedFile.path,
          "${pickedFile.path}_compressed.jpg",
        );

        if (compressedFile != null) {
          print(
              '${event.source == ImageSource.camera ? 'take Photo' : 'add photo'} compressedFile ${compressedFile.path}');
          emit(ParkingLoading());
          // final String? uploadedPhotoUrl =
          //     await parkingRepository.uploadPhoto(compressedFile.path);
          emit(PhotoUploadSuccess(photoUrl: ''));
        } else {
          throw Exception("Photo picking or compressing failed.");
        }
      }
    } catch (error) {
      emit(PhotoUploadFailure(error: error.toString()));
    }
  }
}
