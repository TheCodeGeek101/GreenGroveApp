import 'package:equatable/equatable.dart';

class CarbonFootprintEntity extends Equatable{
  final double ? carbonFootprint;

  const CarbonFootprintEntity({
    this.carbonFootprint,
});

  @override
  List<Object?> get props {
     return [
        carbonFootprint,
    ];
  }
}