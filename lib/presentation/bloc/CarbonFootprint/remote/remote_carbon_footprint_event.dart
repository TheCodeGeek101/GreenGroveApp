import 'package:flutter/material.dart'; // Import the necessary package

abstract class RemoteCarbonFootprintsEvent {
  const RemoteCarbonFootprintsEvent();
}

class PredictUserCarbonFootprints extends RemoteCarbonFootprintsEvent {
  final String activityType;
  final double quantity;
  final String vehicleType;
  final double distance;
  final double fuelEfficiency;
  final String foodType;

  const PredictUserCarbonFootprints({
    required this.activityType,
    required this.quantity,
    required this.vehicleType,
    required this.distance,
    required this.fuelEfficiency,
    required this.foodType,
  });

  @override
  List<Object?> get props => [activityType, quantity, vehicleType, distance, fuelEfficiency, foodType];
}
