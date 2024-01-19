import 'package:green_grove/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/core/resources/data_state.dart';

abstract class CarbonFootprintRepository{

  Future<DataState<List<CarbonFootprintEntity>>>  predictCarbonFootprints();

}
