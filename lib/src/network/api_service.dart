import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:weather/src/model/forecast_model.dart';
import 'package:weather/src/service_locator.dart';

/// Api Service singleton
class ApiService {
  //  To log our responses
  final Logger log = sl.get<Logger>();

  //  To cache our responses
  DioCacheManager _dioCacheManager;

  Options _cacheOptions;

  String _apiKey = '918673ed015df672a950558c4f39e79e';

  Dio _dio;

  // Constructor
  ApiService() {
    _dioCacheManager = DioCacheManager(
      CacheConfig(
        defaultRequestMethod: 'GET',
      ),
    );

    _cacheOptions = buildCacheOptions(
      Duration(
        days: 1,
      ), // Within the first day we return data from cache directly
      maxStale: Duration(
        days: 5,
      ), // After the first day we first check the network and if it fails we use data from cache.. After 5 days we delete the cache
      forceRefresh: true,
    );

    _dio = Dio();

    _dio.interceptors.add(_dioCacheManager.interceptor);
  }

  /// Get current weather using city name
  Future<ForecastModel> getCurrentWeather({@required int cityID}) async {
    Response response = await _dio.get(
      'http://api.openweathermap.org/data/2.5/weather?id=$cityID&units=metric&appid=$_apiKey',
      options: _cacheOptions,
    );

    //   Check the status coe
    log.d(response.statusCode);

    // Log the body data
    log.d(response.data);

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(response.data);
    } else {
      throw {
        'statusCode': response.statusCode,
        'message': response.data,
      };
    }
  }

  /// Get 5 day weather forecast using city id
  Future<List<ForecastModel>> getForecastWeather({@required int cityID}) async {
    Response response = await _dio.get(
      'http://api.openweathermap.org/data/2.5/forecast?id=$cityID&units=metric&appid=$_apiKey',
      options: _cacheOptions,
    );

    //   Check the status coe
    log.d(response.statusCode);

    // Log the body data
    log.d(response.data);

    if (response.statusCode == 200) {
      var forecast = response.data;

      List<ForecastModel> data = List<ForecastModel>.generate(
        forecast['cnt'],
        (index) => ForecastModel.fromJson(
          response.data['list'][index],
        ),
      );

      return data;
    } else {
      throw {
        'statusCode': response.statusCode,
        'message': response.data,
      };
    }
  }
}
