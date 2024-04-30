import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Load extends StatefulWidget {
  const Load({super.key});

  @override
  State<Load> createState() => _LoadState();

}



class _LoadState extends State<Load> {

  //String time = 'Loading...';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Douala', flag: 'cmr.png', path: 'Africa/Douala');
    await instance.getTime();
    //print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
    // setState(() {
    //   time = instance.time;
    // });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        )
      ),
      );
  }
}
