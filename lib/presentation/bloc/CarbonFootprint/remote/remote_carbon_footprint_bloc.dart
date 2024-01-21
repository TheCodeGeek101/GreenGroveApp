import 'package:green_grove/Domain/usecases/predict_carbon_footprints.dart';
import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_event.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCarbonFootprintsBloc extends Bloc<RemoteCarbonFootprintsEvent, RemoteCarbonFootprintState> {
  final PredictCarbonFootprintUseCase _predictCarbonFootprintUseCase;

  RemoteCarbonFootprintsBloc(this._predictCarbonFootprintUseCase): super(const RemoteCarbonFootprintLoading()){
    on <PredictUserCarbonFootprints> (onPredictCarbonFootprints);
  }


  void onPredictCarbonFootprints(PredictUserCarbonFootprints event,Emitter<RemoteCarbonFootprintState> emit) async {
    final datastate = await _predictCarbonFootprintUseCase();

    if(datastate is DataSuccess && datastate.data!.isNotEmpty){
      emit(
        RemoteCarbonFootprintDone(datastate.data!)
      );
    }
    if(datastate is DataFailed){
      emit(
        RemoteCarbonFootprintError(datastate.error!)
      );
    }
  }

}