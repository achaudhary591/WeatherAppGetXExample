import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx_example/model/weather_data.dart';

import '../api/fetch_weather.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  //instances
  RxBool checkLoading() => _isLoading;
  RxDouble getLongitude() => _longitude;
  RxDouble getLatitude() => _latitude;
  
  final weatherData = WeatherData().obs;

  WeatherData getWeatherData(){
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading.isTrue) {
      getLocation();
    }
    else{
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    //status of service
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //request permission
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      //api call
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value){
            weatherData.value = value;
          _isLoading.value = false;
      });

    });
  }

  RxInt getIndex(){
    return _currentIndex;
  }
}
