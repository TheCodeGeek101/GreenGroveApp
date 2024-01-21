// Abstract class representing events related to remote carbon footprints
abstract class RemoteCarbonFootprintsEvent {
  const RemoteCarbonFootprintsEvent();
}

// Event class representing the prediction of carbon footprints by a user
class PredictUserCarbonFootprints extends RemoteCarbonFootprintsEvent {
  // Properties representing various aspects of the carbon footprint prediction
  final String activityType;
  final double quantity;
  final String vehicleType;
  final double distance;
  final double fuelEfficiency;
  final String foodType;

  // Constructor for creating an instance of PredictUserCarbonFootprints
  const PredictUserCarbonFootprints({
    required this.activityType,
    required this.quantity,
    required this.vehicleType,
    required this.distance,
    required this.fuelEfficiency,
    required this.foodType,
  });

  // Override to provide a list of properties for equatability
  @override
  List<Object?> get props =>
      [activityType, quantity, vehicleType, distance, fuelEfficiency, foodType];
}
