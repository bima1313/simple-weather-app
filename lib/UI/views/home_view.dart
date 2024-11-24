import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/UI/components/custom_text_black.dart';
import 'package:weather_app/UI/components/custom_text_white.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/provider/city_provider.dart';
import 'package:weather_app/model/class/weather.dart';
import 'package:weather_app/model/function/weather_code.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final CityProvider city = context.watch<CityProvider>();
    Map weatherNow = {};
    List fourTimes = [];
    List<int> fourTemp = [];
    List<int> fourWeather = [];
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: FutureBuilder(
        future: fetchWeather(
          latitude: city.getCoodinate.latitude,
          longitude: city.getCoodinate.longitude,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData != false) {
                final data = snapshot.data as Weather;
                for (var index = 0; index < data.time.length; index++) {
                  final List<String> splitDateTime =
                      data.time[index].split('T');
                  String timeHourString = splitDateTime[1];
                  int timeHour = int.parse(
                    timeHourString.split(':')[0],
                  );
                  if (now.hour <= timeHour) {
                    if (now.hour == timeHour) {
                      weatherNow.addAll({
                        'temp': data.temperature[index].toInt(),
                        'weather': data.weatherCode[index],
                      });
                    } else {
                      fourTimes.add(timeHourString);
                      fourTemp.add(data.temperature[index].toInt());
                      fourWeather.add(data.weatherCode[index]);
                    }
                  }
                }
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: CustomTextWhite(
                                text: city.getCity,
                                fontSize: 26.0,
                                bold: false,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  selectView,
                                );
                              },
                            ),
                            const Icon(
                              Icons.location_on,
                              size: 26.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                          child: (now.minute < 10)
                              ? CustomTextWhite(
                                  text: 'Today, ${now.hour}:0${now.minute}',
                                  fontSize: 20.0,
                                  bold: true,
                                )
                              : CustomTextWhite(
                                  text: 'Today, ${now.hour}:${now.minute}',
                                  fontSize: 20.0,
                                  bold: true,
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: CustomTextWhite(
                                  text: '${weatherNow['temp']}\u00B0C',
                                  fontSize: 80.0,
                                  bold: true,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 25.0,
                                ),
                                child: Image.asset(
                                  weatherCode(
                                    weatherCode: weatherNow['weather'],
                                    isImage: true,
                                  ),
                                  height: 200.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: CustomTextWhite(
                            text: weatherCode(
                              weatherCode: weatherNow['weather'],
                              isImage: false,
                            ),
                            fontSize: 50.0,
                            bold: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: fourTimes.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: (fourTimes[index] != '23:00')
                                      ? const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 16.0,
                                        )
                                      : const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextBlack(
                                            text: '${fourTimes[index]}',
                                            fontSize: 30.0,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 20.0,
                                                ),
                                                child: CustomTextBlack(
                                                  text:
                                                      '${fourTemp[index]}\u00B0C',
                                                  fontSize: 30.0,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    weatherCode(
                                                      weatherCode:
                                                          fourWeather[index],
                                                      isImage: true,
                                                    ),
                                                    width: 60,
                                                    height: 60,
                                                  ),
                                                  CustomTextBlack(
                                                    text: weatherCode(
                                                      weatherCode:
                                                          fourWeather[index],
                                                      isImage: false,
                                                    ),
                                                    fontSize: 16.0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      (fourTimes[index] != '23:00')
                                          ? const Divider(thickness: 2.0)
                                          : const SizedBox(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SafeArea(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: CustomTextWhite(
                            text: city.getCity,
                            fontSize: 26.0,
                            bold: false,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              selectView,
                            );
                          },
                        ),
                        const Icon(
                          Icons.location_on,
                          size: 26.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ));
              }
            default:
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
          }
        },
      ),
    );
  }
}
