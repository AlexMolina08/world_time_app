import 'package:flutter/material.dart';
import 'package:worldtimeapp/servicios/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> lugares = [
    WorldTime(bandera:"spain.png" ,ubicacion: 'Granada' ,url:'Europe/Madrid'),
    WorldTime(bandera:"alemania.png" ,ubicacion: 'Berlin' ,url:'Europe/Berlin'),
    WorldTime(bandera:"argentina.png" ,ubicacion: 'Buenos Aires' ,url:'America/Argentina/Buenos_Aires'),
    WorldTime(bandera:"bangkok.png" ,ubicacion: 'Bangkok' ,url:'Asia/Bangkok'),
    WorldTime(bandera:"costa_rica.png" ,ubicacion: 'Costa Rica' ,url:'America/Costa_Rica'),
    WorldTime(bandera:"egipto.png" ,ubicacion: 'El Cairo' ,url:'Africa/Cairo'),
    WorldTime(bandera:"corea.png" ,ubicacion: 'Seúl' ,url:'Asia/Seoul'),
    WorldTime(bandera:"usa.png" ,ubicacion: 'Nueva York' ,url:'America/New_York'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Elige una ubicación"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: lugares.length,
        //se utilizará este itembuilder para cada elemento dentro de la lista lugares
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:2.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(lugares[index].ubicacion);
                },
                title: Text(lugares[index].ubicacion),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/${lugares[index].bandera}')
              ),
              )
            ),
          );
        },
      )

    );
  }
}
