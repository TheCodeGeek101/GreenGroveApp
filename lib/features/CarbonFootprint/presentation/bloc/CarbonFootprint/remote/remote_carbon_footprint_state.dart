// Import necessary dependencies
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:green_grove/features/CarbonFootprint/Domain/entities/CarbonFootprint.dart';

// Abstract class representing different states related to remote carbon footprints
abstract class RemoteCarbonFootprintState extends Equatable {
  // List of carbon footprints and DioError representing the state
  final List<CarbonFootprintEntity>? carbonFootprints;
  final DioException ? error;

  // Constructor for creating instances of RemoteCarbonFootprintState
  const RemoteCarbonFootprintState({this.carbonFootprints,  this.error});

  // Override to provide a list of properties for equatability
  List<Object> get props => [carbonFootprints!, error!];
}

// Loading state indicating that a remote operation is in progress
class RemoteCarbonFootprintLoading extends RemoteCarbonFootprintState {
  const RemoteCarbonFootprintLoading();
}

// Done state indicating successful retrieval of carbon footprints
class RemoteCarbonFootprintDone extends RemoteCarbonFootprintState {
  const RemoteCarbonFootprintDone(List<CarbonFootprintEntity> carbonFootprint)
      : super(carbonFootprints: carbonFootprint);
}

// Error state indicating a failure in the remote operation with an associated DioError
class RemoteCarbonFootprintError extends RemoteCarbonFootprintState {
  const RemoteCarbonFootprintError(DioException error) : super(error: error);
}
