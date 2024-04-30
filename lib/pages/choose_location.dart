import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  List<WorldTime> locations = [
    WorldTime(location: 'Douala', flag: 'cmr.png', path: 'Africa/Douala'),
    WorldTime(location: 'London', flag: 'uk.png', path: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'greece.png', path: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', path: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', path: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', path: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.png', path: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', path: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', path: 'Asia/Jakarta'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
        title: const Text('Edit Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
              child: Card(
                child: ListTile(
                  onTap: (){ updateTime(index);},
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
