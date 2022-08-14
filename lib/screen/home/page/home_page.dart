import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constant/keys.dart';
import 'package:weather_app/constant/navigation.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/detail/page/detail_page.dart';
import 'package:weather_app/screen/home/api/home_api.dart';
import 'package:weather_app/ui/image.dart';
import 'package:weather_app/ui/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final state = homeProvider.homeState;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: state.loading == true
          ? Loading.loadingBuilder()
          : weatherCard(homeProvider, state),
    );
  }

  Widget weatherCard(HomeProvider provider, HomeState state) {
    return ListView.builder(
      itemCount: state.weatherModel.list.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      primary: true,
      itemBuilder: (BuildContext context, int index) {
        WeatherList weatherList =
            homeProvider.homeState.weatherModel.list[index];

        DateTime dateTime = DateTime.parse(weatherList.dtTxt);
        var formatDateTime = DateFormat('EE, MMM dd, yyyy hh:mm a').format(
          dateTime,
        );

        var weatherType = weatherList.weather[0].main;
        var weatherIcon = weatherList.weather[0].icon;

        var tempKelvin = weatherList.main.temp;
        double tempKelvinToCelcius = tempKelvin - 273.15;

        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Navigation.navigatePage(
              context,
              DetailPage(
                weatherType: weatherType,
                weatherModel: weatherList,
              ),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    ImageWidget.imageNewtork(
                      "http://openweathermap.org/img/wn/$weatherIcon.png",
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formatDateTime.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          weatherType.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Temp ${tempKelvinToCelcius.toStringAsFixed(1)} ${Keys.celciusDegreeLogo}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: index != state.weatherModel.list.length - 1,
                child: const Divider(height: 0, thickness: 1),
              ),
            ],
          ),
        );
      },
    );
  }
}
