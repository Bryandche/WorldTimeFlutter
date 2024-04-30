import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments;
    print(data);

    //Set background
    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png' ;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
          child: SafeArea(
              child: Column(
                children: [
                  ElevatedButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'location': result['location'],
                            'flag' : result['flag'],
                            'time' : result['time'],
                            'isDayTime' : result['isDayTime'],
                          };
                        });
                        },
                    icon: const Icon(Icons.edit_location),
                    label: const Text('Edit Location'),
                  ),
                  const SizedBox(height: 20.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                          style:const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          )),
                    ],
                  ),

                  const SizedBox(height: 20.0,),
                  Text(
                      data['time'],
                      style:const TextStyle(
                        fontSize: 66.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      )),
                ],
              )
          ),
        ),
      ),
    );
  }
}

