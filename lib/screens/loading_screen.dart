import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const apiKey='c1bf64661232dcee267577133920f63e';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData() async
  {
    WeatherModel weatherModel=WeatherModel();
    var weatherData=await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.cyan,
          size: 100,
        ),
      ),
    );
  }
}

// body: Center(
// child: ElevatedButton(
// onPressed: getLocation,
// child: Text('Get Location'),
// ),
// ),
