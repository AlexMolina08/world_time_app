import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


/*
  Esta clase es una representacion de un lugar , su fecha y su hora
*/
class WorldTime{

  String ubicacion; // Ubicacion
  String time; // Ubicacion actual en esa ubicacion
  String bandera; // url de un icono de una bandera
  String url; // final de la url de la api (ej: Europe/Madrid)



  WorldTime({this.ubicacion,this.bandera,this.url});


  /*
  * Obtiene el tiempo desde worltimeap en formato json y lo convierte a map.
  * */
  Future<void> getTime() async {


    try {
      //Usamos await para que no siga ejecutando el resto de sentencias hasta que no haya obtenido
      //los datos
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url'); //obtenemos el json
      Map datos = jsonDecode(response.body); //lo decodificamos en un map

      //obtener propiedades de datos
      String fechaHora = datos['datetime'];
      String offset = datos['utc_offset'].substring(1, 3);

      //Convertimos esas propiedades a datos manejables
      DateTime actual = DateTime.parse(fechaHora);
      actual = actual.add(Duration(hours: int.parse(offset)));

      //Establecer la hora actual
      time = DateFormat.jm().format(actual);
    }
    catch(e){
      print('ERROR: $e');
      time = "Error: No se ha podido acceder al dato time :(";
    }

  }
}