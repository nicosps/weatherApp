import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constant/keys.dart';
import 'package:weather_app/constant/navigation.dart';
import 'package:weather_app/ui/image.dart';

import '../../../model/weather_model.dart';

class DetailPage extends StatelessWidget {
  final String weatherType;
  final WeatherList weatherModel;
  const DetailPage({
    Key? key,
    required this.weatherType,
    required this.weatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //change kelvin into celcius
    double tempKelvinMinToCelcius = weatherModel.main.tempMin - 273.15;
    double tempKelvinMaxToCelcius = weatherModel.main.tempMax - 273.15;
    double tempKelvinToCelcius = weatherModel.main.temp - 273.15;

    DateTime date = DateTime.parse(
      weatherModel.dtTxt.toString(),
    ); //parse string in DateTime

    var formatDate = DateFormat('EEEE, MMMM dd, yyyy').format(date);
    var formatTime = DateFormat('hh:mm a').format(date);

    var icon = weatherModel.weather[0].icon;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigation.backToPreviousPage(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Weather Details'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              formatDate,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              formatTime,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${tempKelvinToCelcius.toStringAsFixed(1)} ${Keys.celciusDegreeLogo}",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ImageWidget.imageNewtork(
                  "http://openweathermap.org/img/wn/$icon@2x.png",
                ),
              ],
            ),
            Text(
              '$weatherType (${weatherModel.weather[0].description})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                tempWidget(
                  'Temp (min)',
                  "${tempKelvinMinToCelcius.toStringAsFixed(1)} ${Keys.celciusDegreeLogo}",
                ),
                tempWidget(
                  'Temp (max)',
                  "${tempKelvinMaxToCelcius.toStringAsFixed(1)} ${Keys.celciusDegreeLogo}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget tempWidget(String tempTitle, String tempDegree) {
    return Column(
      children: [
        Text(
          tempTitle,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          tempDegree,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
