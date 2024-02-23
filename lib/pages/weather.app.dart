// import 'package:geolocator_platform_interface/src/models/position.dart';

// import 'package:flutter/material.dart';
// import 'package:weather_app2/data/services/geo_location_service.dart';
// import 'package:weather_app2/data/services/weather_service.dart';
// import 'package:weather_app2/pages/city_page.dart';
// import 'package:weather_app2/data/utils/weather_utils.dart';
// import 'package:weather_app2/widgets/custom_progres_indicator.dart';
// import 'package:weather_app2/widgets/weather_page_content.dart';

// class WeatherApp extends StatefulWidget {
//   const WeatherApp({Key? key}) : super(key: key);

//   @override
//   _WeatherAppState createState() => _WeatherAppState();
// }

// class _WeatherAppState extends State<WeatherApp> {
  
//   bool _isLoading = false;

//   @override
//   void initState() {
//     showWeatherByLocation();

//     super.initState();
//   }

//   Future<void> showWeatherByLocation() async {
//     setState(() {
//       _isLoading = true;
//     });
//     await Future.delayed(Duration(seconds: 2));
//     final position = await GeoLocationService().getCurrentPosition();

//     await getWeatherByLocation(position: position);
//   }

//   /// Determine the current position of the device.42
//   ///
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.

//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: IconButton(
//             onPressed: () async  {
//             await  showWeatherByLocation();
//             },
//             icon: const Icon(
//               Icons.navigation,
//               size: 40.0,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               final typedCity = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CityPage(),
//                 ),
//               );
//               await getWeatherByCity(typedCity);
//             },
//             icon: const Icon(
//               Icons.location_city,
//               color: Colors.white,
//               size: 40.0,
//             ),
//           ),
//           const SizedBox(
//             width: 8.0,
//           )
//         ],
//       ),
//       body: Container(
//         child: Center(
//           child: _isLoading
//               ? CustomProgresIndicator()
//               : WeatherPageContent(
//                   cityName: _cityName,
//                   celcius: _celcius,
//                   icon: _icon,
//                   description: _description),
//         ),
//       ),
//     );
//   }

//   Future<void> getWeatherByLocation({required Position position}) async {
//     final _data =
//         await WeatherSercice().getWeatherByLocation(position: position);

//     _cityName = _data['name'];
//     final kelvin = _data['main']['temp'] as num;

//     _celcius = WeatherUtils.kelvinToCelcius(kelvin);

//     _celcius = (kelvin - 273.15).round().toString();
//     _icon = WeatherUtils.getWeatherIcon(kelvin.toInt());
//     _description = WeatherUtils.getDescription(int.parse(_celcius));

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> getWeatherByCity(typedCity) async {
//     setState(() {
//       _isLoading = true;
//     });

//     final _data = await WeatherSercice().getWeatherByCity(typedCity);

//     _cityName = _data['name'];
//     final kelvin = _data['main']['temp'] as num;

//     _celcius = (kelvin - 273.15).round().toString();
//     _icon = WeatherUtils.getWeatherIcon(kelvin.toInt());
//     _description = WeatherUtils.getDescription(int.parse(_celcius));

//     setState(() {
//       _isLoading = false;
//     });
//   }
// }
