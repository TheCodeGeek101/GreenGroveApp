import 'package:green_grove/features/CarbonFootprint/Domain/entities/CarbonFootprint.dart';

class CarbonFootprintModel extends CarbonFootprintEntity {

   const CarbonFootprintModel({
      double ? carbonFootprint ,
  });

   factory CarbonFootprintModel.fromJson(Map <String, dynamic> map) {
        return CarbonFootprintModel(
            carbonFootprint: map['carbonFootprint'] ?? 0.0,
        );

   }

}