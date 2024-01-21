import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/constants/constants.dart';
import '../../models/CarbonFootprintModel.dart';

part 'carbon_footprint_api_service.g.dart';

@RestApi(baseUrl: carbonFootprintBaseUrl)
abstract class CarbonFootprintApiService {
   factory CarbonFootprintApiService(Dio dio) = _CarbonFootprintApiService;

   @POST('/predict')
  Future<HttpResponse<List<CarbonFootprintModel>>> predictCarbonFootprints(data);
}