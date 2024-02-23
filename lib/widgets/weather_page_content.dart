import 'package:flutter/material.dart';

class WeatherPageContent extends StatelessWidget {
  const WeatherPageContent({
    super.key,
    required this.cityName,
    required this.celcius,
    required this.icon,
    required this.description,
  });

  final String cityName;
  final String celcius;
  final String icon;
  final String description;

  @override
  Widget build(BuildContext context) {
  final  _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: _size.height * 0.1,
        ),
        Text(
          cityName.isEmpty ? '0\u00B0 *' : '$celcius\u00B0 $icon',
          style: const TextStyle(
              fontSize: 84, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
        cityName.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  cityName,
                  style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: _size.height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            description,
            style: const TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
