// Import necessary dependencies and files
import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/core/usecases/usecase.dart';
import 'package:green_grove/features/CarbonFootprint/Data/repository/CarbonFootprintRepositoryImpl.dart';
import 'package:green_grove/features/CarbonFootprint/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/features/CarbonFootprint/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_event.dart';

// This use case handles the logic for predicting carbon footprints based on user input
class PredictCarbonFootprintUseCase
    implements UseCase<DataState<List<CarbonFootprintEntity>>, PredictUserCarbonFootprints> {
  // Repository responsible for interacting with the data layer (backend)
  final CarbonFootprintRepositoryImpl _carbonFootprintRepository;

  // Constructor to initialize the use case with the repository
  PredictCarbonFootprintUseCase(this._carbonFootprintRepository);

  // Implementation of the call method defined in the UseCase interface
  @override
  Future<DataState<List<CarbonFootprintEntity>>> call({required PredictUserCarbonFootprints params}) {
    // Call the repository method to predict carbon footprints based on user input
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
