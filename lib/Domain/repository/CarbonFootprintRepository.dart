import 'package:green_grove/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/Domain/entities/CarbonFootprint.dart';

abstract class CarbonFootprintRepository {
  Future<DataState<List<CarbonFootprintEntity>>> predictCarbonFootprints({
    required String activityType,
    required double quantity,
    required String vehicleType,
    required double distance,
    required double fuelEfficiency,
    required String foodType,
  });
}
