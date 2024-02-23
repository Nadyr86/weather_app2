import 'package:flutter/material.dart';
import 'package:weather_app2/data/services/geo_location_service.dart';
import 'package:weather_app2/data/services/weather_service.dart';
import 'package:weather_app2/models/weather_model.dart';
import 'package:weather_app2/pages/city_page.dart';
import 'package:weather_app2/widgets/container_with_bg_widget.dart';
import 'package:weather_app2/widgets/custom_progres_indicator.dart';
import 'package:weather_app2/widgets/weather_page_content.dart';

class WeatherModelPage extends StatefulWidget {
  const WeatherModelPage({Key? key}) : super(key: key);

  @override
  _WeatherModelPageState createState() => _WeatherModelPageState();
}

class _WeatherModelPageState extends State<WeatherModelPage> {
  bool _isLoading = true;
  WeatherModel? _weatherModel;

  @override
  void initState() {
    showWeatherByLocation();
    super.initState();
  }

  Future<void> showWeatherByLocation() async {
    setState(() {
      _isLoading = true;
    });
    final _position = await GeoLocationService().getCurrentPosition();
    _weatherModel = await WeatherSercice().getWeatherModelByLocation(_position);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getWeatherByCity(String _city) async {
    setState(() {
      _isLoading = true;
    });
    _weatherModel = await WeatherSercice().getWeatherModelByCity(_city);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () async {
              await  showWeatherByLocation();
            },
            icon: const Icon(
              Icons.navigation,
              size: 40.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final typedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityPage(),
                ),
              );
              await getWeatherByCity(typedCity);
            },
            icon: const Icon(
              Icons.location_city,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          const SizedBox(
            width: 8.0,
          )
        ],
      ),
      body: ContainerWithBgWidget(
        child: _isLoading
            ?  CustomProgresIndicator()
            : WeatherPageContent(
                icon: _weatherModel!.icon,
                cityName: _weatherModel!.cityName,
                celcius: _weatherModel!.celcius,
                description: _weatherModel!.description,
              ),
      ),
    );
  }
}
