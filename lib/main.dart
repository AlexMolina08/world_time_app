import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/choose_location.dart';

/**
 * La App se compone 3 ventanas
 *  Home Screen(donde se mostrará el tiempo)
 *  Loading Screen
 *  Updating Screen (donde se cambiará la ubicación)
 * */

void main() => runApp(MaterialApp(
    /* El argumento routes recibe un map con la clave las rutas y
    *  valor una función abstracta , que tiene como parametro context , que
    *  es la ubicación actual dentro del arbol de ventanas
    *
    * */

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },


));