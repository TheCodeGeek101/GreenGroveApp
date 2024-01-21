// Import necessary dependencies and files
import 'package:dio/dio.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:green_grove/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_grove/features/CarbonFootprint/Domain/usecases/predict_carbon_footprints.dart';
import 'package:green_grove/features/CarbonFootprint/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_event.dart';
import 'package:green_grove/features/CarbonFootprint/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_state.dart';

// Bloc for managing remote carbon footprint-related events and states
class RemoteCarbonFootprintsBloc
    extends Bloc<RemoteCarbonFootprintsEvent, RemoteCarbonFootprintState> {
  // Instance of the PredictCarbonFootprintUseCase for handling carbon footprint predictions
  final PredictCarbonFootprintUseCase _predictCarbonFootprintUseCase;

  // Constructor to initialize the bloc with an initial loading state
  RemoteCarbonFootprintsBloc(this._predictCarbonFootprintUseCase)
      : super(const RemoteCarbonFootprintLoading()) {
    // Define the event handler for PredictUserCarbonFootprints events
    on<PredictUserCarbonFootprints>(onPredictCarbonFootprints);
  }

  // Event handler for PredictUserCarbonFootprints events
  void onPredictCarbonFootprints(
      PredictUserCarbonFootprints event, Emitter<RemoteCarbonFootprintState> emit) async {
    try {
      // Call the PredictCarbonFootprintUseCase to get the predicted carbon footprints
      final datastate = await _predictCarbonFootprintUseCase.call(params: event);

      // Check if the datastate is a successful one and the data is not empty
      if (datastate is DataSuccess && datastate.data!.isNotEmpty) {
        // Emit the RemoteCarbonFootprintDone state with the received data
        emit(
          RemoteCarbonFootprintDone(datastate.data!),
        );
      } else {
        // Handle the case when datastate is DataSuccess but the data is empty
        emit(
          RemoteCarbonFootprintError(DioException(requestOptions: RequestOptions())),
        );
      }
    } catch (e) {
      // Handle errors here
      emit(
        RemoteCarbonFootprintError(DioException(requestOptions: RequestOptions())),
      );
    }
  }
}
