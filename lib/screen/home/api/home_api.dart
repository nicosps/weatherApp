import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constant/api_keys.dart';
import 'package:weather_app/constant/keys.dart';
import 'package:weather_app/model/weather_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeState homeState = HomeState(
    weatherModel: WeatherModel(city: City(coord: Coord())),
  );
  var dio = Dio();

  HomeProvider() {
    getWeatherList();
  }

  Future<dynamic> getWeatherList() async {
    homeState.loading = true;
    try {
      var response = await dio.get(ApiKeys.apiUrl, queryParameters: {
        "lat": Keys.latitude,
        "lon": Keys.longitude,
        "appid": ApiKeys.apiKeys,
      });
      if (response.statusCode == 200) {
        homeState.weatherModel = WeatherModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
      throw {
        'status': e.response!.statusCode,
        'errors': e.response!.statusMessage,
      };
    }
    notifyListeners();
    homeState.loading = false;
    return false;
  }
}

class HomeState {
  WeatherModel weatherModel;
  bool isError;
  bool loading;
  bool empty;

  HomeState({
    required this.weatherModel,
    this.isError = false,
    this.loading = true,
    this.empty = true,
  });
}
