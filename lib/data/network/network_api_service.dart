import 'dart:async';

import 'dart:io';
import 'dart:convert';
import 'package:employee/data/api_endpoints.dart';
import 'package:employee/data/app_exceptions.dart';
import 'package:employee/data/network/base_api_services.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    'Access-Control-Allow-Headers': 'Content-Type',
  };

  static const int timeOutDuration = 60;
  //------------------------get api response---------------------/

  @override
  Future getGetApiResponse(String path, Map<String, dynamic> queryParameter,
      [String baseUrl = ApiEndPoint.baseUrl]) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
              Uri.https(
                baseUrl,
                path,
                queryParameter,
              ),
              headers: headers)
          .timeout(
            const Duration(seconds: timeOutDuration),
          );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet");
    }

    return responseJson;
  }

//-----------------------get post api response-------------------//
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.https(ApiEndPoint.baseUrl, url),
        body: json.encode(data),
        headers: headers,
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  //--------------------------Put api response-------------------//

  @override
  Future getPutApiResponse(
    String url,
    dynamic data,
  ) async {
    dynamic responseJson;

    try {
      Response response = await put(
        Uri.https(
          ApiEndPoint.baseUrl,
          url,
        ),
        body: json.encode(data),
        headers: headers,
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  //--------------------------Delete api response-------------------//
  @override
  Future getDeleteApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await delete(
        Uri.https(
          ApiEndPoint.baseUrl,
          url,
        ),
        body: json.encode(data),
        headers: headers,
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
        throw UnauthorisedException(
          response.body.toString(),
        );
      case 505:
        throw InvalidInputException(
          response.body.toString(),
        );
      case 500:
        throw InternalServerException(
          response.body.toString(),
        );
      case 401:
        throw UnAuthorizedException(
          response.body.toString(),
        );
      case 409:
        throw ConflictException(
          response.body.toString(),
        );

      default:
        throw FetchDataException(
          "Error occured while communicating with server with status code${response.statusCode}",
        );
    }
  }
}
