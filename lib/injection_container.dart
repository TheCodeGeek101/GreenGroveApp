// Import necessary dependencies and files
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:green_grove/Data/data_sources/remote/carbon_footprint_api_service.dart';
import 'package:green_grove/Data/repository/CarbonFootprintRepositoryImpl.dart';
import 'package:green_grove/Domain/repository/CarbonFootprintRepository.dart';
import 'package:green_grove/Domain/usecases/predict_carbon_footprints.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_bloc.dart';

// Create an instance of GetIt for dependency injection
final sl = GetIt.instance;

// Asynchronously initialize dependencies
Future<void> initializeDependencies() async {
  // Dio (HTTP client) is registered as a singleton
  sl.registerSingleton<Dio>(Dio());

  // CarbonFootprintApiService is registered as a singleton, injecting Dio instance
  sl.registerSingleton<CarbonFootprintApiService>(CarbonFootprintApiService(sl()));

  // CarbonFootprintRepository is registered as a singleton, injecting CarbonFootprintApiService instance
  sl.registerSingleton<CarbonFootprintRepository>(
    CarbonFootprintRepositoryImpl(sl()) as CarbonFootprintRepository,
  );

  // PredictCarbonFootprintUseCase is registered as a singleton, injecting CarbonFootprintRepository instance
  sl.registerSingleton<PredictCarbonFootprintUseCase>(
    PredictCarbonFootprintUseCase(sl()),
  );

  // RemoteCarbonFootprintsBloc is registered as a factory, injecting PredictCarbonFootprintUseCase instance
  sl.registerFactory<RemoteCarbonFootprintsBloc>(
        () => RemoteCarbonFootprintsBloc(sl()),
  );
}
