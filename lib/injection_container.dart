import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:green_grove/Data/data_sources/remote/carbon_footprint_api_service.dart';
import 'package:green_grove/Data/repository/CarbonFootprintRepositoryImpl.dart';
import 'package:green_grove/Domain/repository/CarbonFootprintRepository.dart';
import 'package:green_grove/Domain/usecases/predict_carbon_footprints.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
    //   Dio
    sl.registerSingleton<Dio>(Dio());

    //   Dependencies
    sl.registerSingleton<CarbonFootprintApiService>(CarbonFootprintApiService(sl()));

    sl.registerSingleton<CarbonFootprintRepository>(
      CarbonFootprintRepositoryImpl(sl())
    );

    // Usecases
    sl.registerSingleton<PredictCarbonFootprintUseCase>(
       PredictCarbonFootprintUseCase(sl())
    );

    // Blocs
     sl.registerFactory<RemoteCarbonFootprintsBloc>(
         () => RemoteCarbonFootprintsBloc(sl())
     );
}