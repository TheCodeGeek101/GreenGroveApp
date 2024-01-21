import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/core/usecases/usecase.dart';
import 'package:green_grove/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/domain/repository/CarbonFootprintRepository.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_event.dart';

class PredictCarbonFootprintUseCase
    implements UseCase<DataState<List<CarbonFootprintEntity>>, PredictUserCarbonFootprints> {
  final CarbonFootprintRepository _carbonFootprintRepository;

  PredictCarbonFootprintUseCase(this._carbonFootprintRepository);

  @override
  Future<DataState<List<CarbonFootprintEntity>>> call({required PredictUserCarbonFootprints params}) {
    return _carbonFootprintRepository.predictCarbonFootprints(
      activityType: params.activityType,
      quantity: params.quantity,
      vehicleType: params.vehicleType,
      distance: params.distance,
      fuelEfficiency: params.fuelEfficiency,
      foodType: params.foodType,
    );
  }
}
