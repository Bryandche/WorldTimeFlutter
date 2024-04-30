import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location = '';
  String time = '';
  String flag = '';
  String path = ' ';
  late bool isDayTime;

  // Constructor
  WorldTime({required this.location,required this.flag,required this.path});


  Future<void> getTime() async{

    try{
      Uri url = Uri.parse("http://worldtimeapi.org/api/timezone/$path");

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      Map data = jsonDecode(response.body);


      // Obtaining datetime and offset from API endpoint
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // Creating datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }catch(e){
      print('Error: $e');
    }



  }

}