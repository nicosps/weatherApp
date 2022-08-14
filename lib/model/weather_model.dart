class WeatherModel {
  String cod;
  int message;
  int cnt;
  List<WeatherList> list;
  City city;

  WeatherModel({
    this.cod = "",
    this.message = 0,
    this.cnt = 0,
    this.list = const [],
    required this.city,
  });

  static WeatherModel fromJson(json) {
    return WeatherModel(
      cod: json['cod'] ?? "",
      message: json['message'] ?? 0,
      cnt: json['cnt'] ?? 0,
      city: (json['city'] != null)
          ? City.fromJson(json['city'])
          : City(coord: Coord()),
      list: WeatherList.fromJsonToList(json),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    data['list'] = list.map((v) => v.toJson()).toList();
    data['city'] = city.toJson();
    return data;
  }
}

class WeatherList {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  dynamic pop;
  Rain rain;
  Sys sys;
  String dtTxt;

  WeatherList({
    required this.main,
    required this.clouds,
    required this.wind,
    required this.rain,
    required this.sys,
    this.weather = const [],
    this.dt = 0,
    this.visibility = 0,
    this.pop,
    this.dtTxt = "",
  });

  static WeatherList fromJson(json) {
    return WeatherList(
      main: (json['main'] != null) ? Main.fromJson(json['main']) : Main(),
      clouds:
          (json['clouds'] != null) ? Clouds.fromJson(json['clouds']) : Clouds(),
      wind: (json['wind'] != null) ? Wind.fromJson(json['wind']) : Wind(),
      rain: (json['rain'] != null) ? Rain.fromJson(json['rain']) : Rain(),
      sys: (json['sys'] != null) ? Sys.fromJson(json['sys']) : Sys(),
      weather: Weather.fromJsonToList(json),
      dt: json['dt'] ?? 0,
      visibility: json['visibility'] ?? 0,
      pop: json['pop'] ?? "",
      dtTxt: json['dt_txt'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['main'] = main.toJson();
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['clouds'] = clouds.toJson();
    data['wind'] = wind.toJson();
    data['visibility'] = visibility;
    data['pop'] = pop;
    data['rain'] = rain.toJson();
    data['sys'] = sys.toJson();
    data['dt_txt'] = dtTxt;
    return data;
  }

  static List<WeatherList> fromJsonToList(json) {
    List<dynamic>? jsonElements = json['list'];
    if (jsonElements != null && jsonElements.isNotEmpty) {
      return List<WeatherList>.from(jsonElements.map((e) => fromJson(e)));
    }
    return [];
  }
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  dynamic humidity;
  dynamic tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure = 0,
    this.seaLevel = 0,
    this.grndLevel = 0,
    this.humidity,
    this.tempKf,
  });

  static Main fromJson(json) {
    return Main(
      temp: json['temp'] ?? 0,
      feelsLike: json['feels_like'] ?? 0,
      tempMin: json['temp_min'] ?? 0,
      tempMax: json['temp_max'] ?? 0,
      pressure: json['pressure'] ?? 0,
      seaLevel: json['sea_level'] ?? 0,
      grndLevel: json['grnd_level'] ?? 0,
      humidity: json['humidity'] ?? 0,
      tempKf: json['temp_kf'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.id = 0,
    this.main = "",
    this.description = "",
    this.icon = "",
  });

  static Weather fromJson(json) {
    return Weather(
      id: json['id'] ?? 0,
      main: json['main'] ?? "",
      description: json['description'] ?? "",
      icon: json['icon'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  static List<Weather> fromJsonToList(json) {
    List<dynamic>? jsonElements = json['weather'];
    if (jsonElements != null && jsonElements.isNotEmpty) {
      return List<Weather>.from(jsonElements.map((e) => fromJson(e)));
    }
    return [];
  }
}

class Clouds {
  int all;

  Clouds({this.all = 0});

  static Clouds fromJson(json) {
    return Clouds(all: json['all'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Wind {
  dynamic speed;
  int deg;
  double gust;

  Wind({
    this.speed,
    this.deg = 0,
    this.gust = 0.0,
  });

  static Wind fromJson(json) {
    return Wind(
      speed: json['speed'] ?? 0,
      deg: json['deg'] ?? 0,
      gust: json['gust'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class Rain {
  double d3h;

  Rain({this.d3h = 0.0});

  static Rain fromJson(json) {
    return Rain(d3h: json['3h'] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }
}

class Sys {
  String pod;

  Sys({this.pod = ""});

  static Sys fromJson(json) {
    return Sys(pod: json['pod'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    this.id = 0,
    this.name = "",
    required this.coord,
    this.country = "",
    this.population = 0,
    this.timezone = 0,
    this.sunrise = 0,
    this.sunset = 0,
  });

  static City fromJson(json) {
    return City(
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : Coord(),
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      country: json['country'] ?? "",
      population: json['population'] ?? 0,
      timezone: json['timezone'] ?? 0,
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord.toJson();
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat = 0.0, this.lon = 0.0});

  static Coord fromJson(json) {
    return Coord(
      lat: json['lat'] ?? 0.0,
      lon: json['lon'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
