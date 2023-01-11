import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx_example/controller/global_controller.dart';
import 'package:weather_app_getx_example/widgets/daily_weather_forecast.dart';
import 'package:weather_app_getx_example/widgets/header_widget.dart';

import '../utils/custom_colors.dart';
import '../widgets/comfort_level.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        height: 250,
                        width: 250,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : Center(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),

                      //for current temp
                      CurrentWeatherWidget(
                        weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      HourlyWeatherWidget(
                        weatherDataHourly: globalController.getWeatherData().getHourlyWeather(),
                      ),

                      DailyWeatherForecast(
                        weatherDataDaily: globalController.getWeatherData().getDailyWeather(),
                      ),

                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ComfortLevel(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),)
                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
