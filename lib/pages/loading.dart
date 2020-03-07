import 'package:flutter/material.dart';
import 'package:worldtimeapp/servicios/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(bandera:"spain.png" ,ubicacion: 'New York' ,url:'Europe/Madrid');
    await worldTime.getTime();
    print(worldTime.time);
    setState( (){
      time = worldTime.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(50.0),
        child:Text(time)
      )
    );
  }
}
