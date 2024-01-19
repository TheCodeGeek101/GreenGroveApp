import 'package:equatable/equatable.dart';

class CarbonFootprintEntity extends Equatable{
  final String ? activity_type;
  final String ? vehicle_type;
  final double ? distance;
  final double ? fuelEfficiency;
  final double ? quantity;


  const CarbonFootprintEntity({
    this.activity_type,
    this.vehicle_type,
    this.distance,
    this.fuelEfficiency,
    this.quantity
});

  @override
  List<Object?> get props {
     return [
        activity_type,
        vehicle_type,
        distance,
        fuelEfficiency,
        quantity
    ];
  }
}