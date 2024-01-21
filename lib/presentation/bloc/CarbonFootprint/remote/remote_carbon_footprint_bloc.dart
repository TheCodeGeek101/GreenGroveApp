import 'package:dio/src/dio_exception.dart';
import 'package:green_grove/Domain/usecases/predict_carbon_footprints.dart';
import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_event.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCarbonFootprintsBloc extends Bloc<RemoteCarbonFootprintsEvent, RemoteCarbonFootprintState> {
  final PredictCarbonFootprintUseCase _predictCarbonFootprintUseCase;

  RemoteCarbonFootprintsBloc(this._predictCarbonFootprintUseCase) : super(const RemoteCarbonFootprintLoading()) {
    on<PredictUserCarbonFootprints>(onPredictCarbonFootprints);
  }

  void onPredictCarbonFootprints(PredictUserCarbonFootprints event, Emitter<RemoteCarbonFootprintState> emit) async {
    try {
      final datastate = await _predictCarbonFootprintUseCase.call(params: event);

      if (datastate is DataSuccess && datastate.data!.isNotEmpty) {
        emit(
          RemoteCarbonFootprintDone(datastate.data!),
        );
      } else {
        // Handle the case when datastate is DataSuccess but the data is empty
        emit(
          RemoteCarbonFootprintError('Empty data received' as DioError),
        );
      }
    } catch (e) {
      // Handle errors here
      emit(
        RemoteCarbonFootprintError('An error occurred: $e' as DioError),
      );
    }
  }
}
