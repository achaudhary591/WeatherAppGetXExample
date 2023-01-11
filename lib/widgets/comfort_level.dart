import 'package:flutter/material.dart';
import 'package:weather_app_getx_example/model/weather_data_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;

  const ComfortLevel({Key? key, required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 8,
                      progressBarWidth: 12
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: const TextStyle(
                        letterSpacing: 0.1,
                        fontSize: 14,
                        height: 1.5
                      )
                    ),
                    animDurationMultiplier: 2,
                    animationEnabled: true,
                    size: 140,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Feels Like ",
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        TextSpan(
                          text: "${weatherDataCurrent.current.feelsLike}",
                          style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    margin: const EdgeInsets.only(left: 30, right: 40),
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),

                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "UV Index ",
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        TextSpan(
                          text: "${weatherDataCurrent.current.uvi}",
                          style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],                
              )
            ],
          ),
        ),
      ],
    );
  }
}
