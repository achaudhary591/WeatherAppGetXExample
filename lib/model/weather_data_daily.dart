class WeatherDataDaily{
  final List<Daily> daily;
  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String , dynamic> json) =>
      WeatherDataDaily(daily: List<Daily>.from(json['daily'].map((e) =>
          Daily.fromJson(e))));
}


class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;

  Daily({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Daily.fromJson(Map<String, Object?> json) => Daily(
    dt: json['dt'] as int?,
    temp: json['temp'] == null
        ? null
        : Temp.fromJson(json['temp']! as Map<String, Object?>),
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  Map<String, Object?> toJson() => {
    'dt': dt,
    'temp': temp?.toJson(),
    'weather': weather?.map((e) => e.toJson()).toList(),
  };
}

class Temp {
  double? day;
  int? min;
  int? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, Object?> json) => Temp(
    day: (json['day'] as num?)?.toDouble(),
    min: (json['min'] as num?)?.round(),
    max: (json['max'] as num?)?.round(),
    night: (json['night'] as num?)?.toDouble(),
    eve: (json['eve'] as num?)?.toDouble(),
    morn: (json['morn'] as num?)?.toDouble(),
  );

  Map<String, Object?> toJson() => {
    'day': day,
    'min': min,
    'max': max,
    'night': night,
    'eve': eve,
    'morn': morn,
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
