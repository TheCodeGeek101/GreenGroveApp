import 'package:green_grove/Domain/entities/CarbonFootprint.dart';
import 'package:green_grove/Domain/repository/CarbonFootprintRepository.dart';
import 'package:green_grove/core/resources/data_state.dart';

import '../models/CarbonFootprintModel.dart';

class CarbonFootprintRepositoryImpl implements CarbonFootprintRepository {

  @override
  Future<DataState<List<CarbonFootprintModel>>> predictCarbonFootprints() {
      throw UnimplementedError();
  }

}