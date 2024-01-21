// Import necessary dependencies and files
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:green_grove/core/resources/data_state.dart';
import 'package:green_grove/features/CarbonFootprint/Data/data_sources/remote/carbon_footprint_api_service.dart';
import 'package:green_grove/features/CarbonFootprint/Domain/repository/CarbonFootprintRepository.dart';
import '../models/CarbonFootprintModel.dart';

// Repository implementation for interacting with carbon footprint data
class CarbonFootprintRepositoryImpl implements CarbonFootprintRepository {
  // Instance of CarbonFootprintApiService for making API requests
  final CarbonFootprintApiService _carbonFootprintApiService;

  // Constructor to initialize the repository with the API service
  CarbonFootprintRepositoryImpl(this._carbonFootprintApiService);

  // Method for predicting carbon footprints based on user input
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
      // Call the retrofit API to post data
      final httpResponse = await _carbonFootprintApiService.predictCarbonFootprint(
        activityType,
        quantity,
        vehicleType,
        distance,
        fuelEfficiency,
        foodType,
      );

      // If the data is posted successfully
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      // If the request is not successful
      else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } catch (e) {
      // Handle errors and return an appropriate DataState
      return DataFailed(DioException(error: e.toString(), requestOptions: RequestOptions()));
    }
  }
}
