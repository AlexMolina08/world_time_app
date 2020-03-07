import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  /*
  * Obtiene el tiempo desde worltimeap en formato json y lo convierte a map.
  * */
  void getTime() async {

    /*Usamos await para que no siga ejecutando el resto de sentencias hasta que no haya obtenido
    //los datos*/
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/Madrid');
    Map datos = jsonDecode(response.body);
    //print(datos);

    //obtener propiedades de datos
    String fechaHora = datos['datetime'];
    String offset = datos['utc_offset'];
    print(fechaHora);
    print(offset);

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text("Loading...")
    );
  }
}
