import 'package:green_grove/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/Domain/repository/CarbonFootprintRepository.dart';
import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/core/usecases/usecase.dart';

class PredictCarbonFootprintUseCase implements UseCase<DataState<List<CarbonFootprintEntity>>,void>{
  final CarbonFootprintRepository _carbonFootprintRepository;

  PredictCarbonFootprintUseCase(this._carbonFootprintRepository);

  @override
  Future<DataState<List<CarbonFootprintEntity>>> call({void params}) {
      return _carbonFootprintRepository.predictCarbonFootprints();
  }


}