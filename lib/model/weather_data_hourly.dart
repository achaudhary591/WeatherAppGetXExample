

class WeatherDataHourly{
  final List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String , dynamic> json) =>
      WeatherDataHourly(hourly: List<Hourly>.from(json['hourly'].map((e) =>
      Hourly.fromJson(e))));
}

class Hourly {
  int? dt;
  int? temp;
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Hourly.fromJson(Map<String, Object?> json) => Hourly(
    dt: json['dt'] as int?,
    temp: (json['temp'] as num?)?.round(),
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  Map<String, Object?> toJson() => {
    'dt': dt,
    'temp': temp,
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
