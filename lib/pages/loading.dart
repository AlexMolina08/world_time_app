import 'package:flutter/material.dart';
import 'package:worldtimeapp/servicios/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(bandera:"spain.png" ,ubicacion: 'New York' ,url:'America/New_York');
    await worldTime.getTime(); //Funcion asíncrona
    print(worldTime.time);
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text("Loading...")
    );
  }
}
