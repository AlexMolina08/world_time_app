import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String ubicacion; // Ubicacion
  String hora; // Ubicacion actual en esa ubicacion
  String bandera; // url de un icono de una bandera
  String url; // final de la url de la api (ej: Europe/Madrid)


  /*
  * Obtiene el tiempo desde worltimeap en formato json y lo convierte a map.
  * */
  void getTime() async {

    /*Usamos await para que no siga ejecutando el resto de sentencias hasta que no haya obtenido
    //los datos*/
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/Madrid'); //obtenemos el json
    Map datos = jsonDecode(response.body); //lo decodificamos en un map

    //obtener propiedades de datos
    String fechaHora = datos['datetime'];
    String offset = datos['utc_offset'].substring(1,3);

    //Convertimos esas propiedades a datos manejables
    DateTime actual = DateTime.parse(fechaHora);
    actual = actual.add(Duration(hours:int.parse(offset)));

    print(actual);

  }


}