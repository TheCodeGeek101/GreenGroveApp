// Import necessary dependency for Equatable
import 'package:equatable/equatable.dart';

// Entity class representing a carbon footprint
class CarbonFootprintEntity extends Equatable {
  // The carbon footprint value (nullable)
  final double? carbonFootprint;

  // Constructor to initialize the entity with the carbonFootprint value
  const CarbonFootprintEntity({
    this.carbonFootprint,
  });

  // Override the props getter from Equatable to define the equality comparison properties
  @override
  List<Object?> get props {
    return [
      carbonFootprint, // Include the carbonFootprint value in the equality check
    ];
  }
}
