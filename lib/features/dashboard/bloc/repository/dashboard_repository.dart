import 'package:employee/data/api_endpoints.dart';
import 'package:employee/data/network/base_api_services.dart';
import 'package:employee/data/network/network_api_service.dart';

class DashboardRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> getEmployess() async {
    try {
      dynamic response =
          _apiServices.getGetApiResponse(ApiEndPoint.getEmployeeList, {});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
