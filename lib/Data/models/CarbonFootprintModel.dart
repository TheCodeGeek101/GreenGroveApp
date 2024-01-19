import 'package:green_grove/Domain/entities/CarbonFootprint.dart';

class CarbonFootprintModel extends CarbonFootprintEntity {
   const CarbonFootprintModel({
      String ? activity_type,
      String ? vehicle_type,
      double ? distance,
      double ? fuelEfficiency,
      double ? quantity
  });

   factory CarbonFootprintModel.fromJson(Map <String, dynamic> map) {
        return CarbonFootprintModel(
            activity_type: map['activity_type'] ?? "",
            vehicle_type: map['vehicle_type'] ?? "",
            distance: map['distance'] ?? "",
            fuelEfficiency: map['fuelEfficiency'] ?? "",
            quantity: map['quantity'] ?? "",
        );

   }

}