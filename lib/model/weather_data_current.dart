
class WeatherDataCurrent{
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String , dynamic> json) => WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? uvi;
  double? feelsLike;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.feelsLike,
    this.uvi
  });

  factory Current.fromJson(Map<String, Object?> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'humidity': humidity,
        'uvi': uvi,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
