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
  Future<DataState<List<CarbonFootprintModel>>> predictCarbonFootprints(data) async {
    try {
      // Create a list of CarbonFootprintModel instances
      final carbonFootprintActivities = {

      }

      // Call the API service method with the list as the request body
      final httpResponse = await _carbonFootprintApiService.predictCarbonFootprints(data);
      
      if(httpResponse.response.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions
          )
        );
      }

      // Handle the httpResponse and return the appropriate DataState
      // (Success, Error, Loading, etc.) based on the response
    } catch (e) {
      // Handle errors and return an appropriate DataState
    }
  }
}
