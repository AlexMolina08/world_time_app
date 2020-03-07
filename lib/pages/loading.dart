import 'package:flutter/material.dart';
import 'package:worldtimeapp/servicios/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(bandera:"spain.png" ,ubicacion: 'Granada' ,url:'Australia/Sydney');
    await worldTime.getTime();
    //Reemplazamos una ruta por otra (De / a /home)
    Navigator.pushReplacementNamed(context , '/home' , arguments: {
      'ubicacion' : worldTime.ubicacion,
      'time' : worldTime.time,
      'bandera': worldTime.bandera,
      'haySol' : worldTime.haySol
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
      backgroundColor: Colors.blue[600],
      body: Center(
        child:SpinKitPouringHourglass(
          color:Colors.lightGreenAccent,
          size:80.0,
          duration: Duration(milliseconds: 1100),
        )
      )
    );
  }
}
