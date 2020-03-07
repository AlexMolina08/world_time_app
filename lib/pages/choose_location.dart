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


  void actualizaTime(index) async{
    WorldTime worldTime = lugares[index];
    await worldTime.getTime(); //Esperamos aqui hasta que se consiga


    //Ir a la pantalla de inicio
    //Usamos pop de Navigator , que saca de la pila la ventana actual y le
    //pasa datos a traves de un map a la anterior
    Navigator.pop(context , {
      'ubicacion' : worldTime.ubicacion,
      'time' : worldTime.time,
      'bandera': worldTime.bandera,
      'haySol' : worldTime.haySol
    });
  }

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
                  actualizaTime(index);
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
