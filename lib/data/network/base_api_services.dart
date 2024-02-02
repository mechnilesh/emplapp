abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(
      String path, Map<String, dynamic> queryParameter,
      [String baseUrl]);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPutApiResponse(
    String url,
    dynamic data,
  );

  Future<dynamic> getDeleteApiResponse(
    String url,
    dynamic data,
  );
}
