import 'dart:html';
import 'package:dio/dio.dart';
import 'package:green_grove/Data/data_sources/remote/carbon_footprint_api_service.dart';
import 'package:green_grove/Domain/repository/CarbonFootprintRepository.dart';
import 'package:green_grove/core/resources/data_state.dart';
import '../models/CarbonFootprintModel.dart';

class CarbonFootprintRepositoryImpl implements CarbonFootprintRepository {
  final CarbonFootprintApiService _carbonFootprintApiService;

  CarbonFootprintRepositoryImpl(this._carbonFootprintApiService);

  @override
  Future<DataState<List<CarbonFootprintModel>>> predictCarbonFootprints({
    required String activityType,
    required double quantity,
    required String vehicleType,
    required double distance,
    required double fuelEfficiency,
    required String foodType,
  }) async {
    try {
      final httpResponse = await _carbonFootprintApiService.predictCarbonFootprint(
        activityType,
        quantity,
        vehicleType,
        distance,
        fuelEfficiency,
        foodType,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions ?? RequestOptions(),
          ),
        );
      }
    } catch (e) {
      // Handle errors and return an appropriate DataState
      return DataFailed(DioError(error: e.toString(), requestOptions: RequestOptions()));
    }
  }
}
