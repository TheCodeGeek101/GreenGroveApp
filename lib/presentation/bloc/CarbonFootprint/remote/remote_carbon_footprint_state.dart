import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:green_grove/Domain/entities/CarbonFootprint.dart';

abstract class RemoteCarbonFootprintState extends Equatable {
  final List<CarbonFootprintEntity> ? carbonFootprints;
  final DioError ? error;

  const RemoteCarbonFootprintState({this.carbonFootprints, this.error});

  List<Object> get props => [carbonFootprints!, error!];
}

class RemoteCarbonFootprintLoading extends RemoteCarbonFootprintState {
    const RemoteCarbonFootprintLoading();
}

class RemoteCarbonFootprintDone extends RemoteCarbonFootprintState {
   const RemoteCarbonFootprintDone(List<CarbonFootprintEntity> carbonFootprint): super(carbonFootprints: carbonFootprint);
}

class RemoteCarbonFootprintError extends RemoteCarbonFootprintState {
    const RemoteCarbonFootprintError(DioError error): super(error: error);
}