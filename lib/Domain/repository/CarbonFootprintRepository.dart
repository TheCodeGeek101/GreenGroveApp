// Import necessary dependencies and files
import 'package:green_grove/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/core/resources/data_state.dart';

// Abstract class defining the contract for interacting with carbon footprint data
abstract class CarbonFootprintRepository {
  // Method for predicting carbon footprints based on user input
  // Returns a DataState with a list of CarbonFootprintEntity or an error
  Future<DataState<List<CarbonFootprintEntity>>> predictCarbonFootprints({
    required String activityType,      // Type of activity (e.g., Transportation, Food)
    required double quantity,          // Quantity associated with the activity
    required String vehicleType,       // Type of vehicle (relevant for Transportation)
    required double distance,          // Distance traveled (relevant for Transportation)
    required double fuelEfficiency,    // Fuel efficiency (relevant for Transportation)
    required String foodType,          // Type of food (relevant for Food)
  });
}
