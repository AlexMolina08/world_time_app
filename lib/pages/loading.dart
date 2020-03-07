import 'package:flutter/material.dart';
import 'package:worldtimeapp/servicios/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(bandera:"spain.png" ,ubicacion: 'Granada' ,url:'Europe/Madrid');
    await worldTime.getTime();
    //Reemplazamos una ruta por otra (De / a /home)
    Navigator.pushReplacementNamed(context , '/home' , arguments: {
      'ubicacion' : worldTime.ubicacion,
      'time' : worldTime.time,
      'bandera': worldTime.bandera
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
        child:Text('CARGANDO...')
      )
    );
  }
}
