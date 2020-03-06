import 'package:flutter/material.dart';
import 'pages/home.dart';

/**
 * La App se compone 3 ventanas
 *  Home Screen(donde se mostrará el tiempo)
 *  Loading Screen
 *  Updating Screen (donde se cambiará la ubicación)
 * */

void main() => runApp(MaterialApp(
    home: Home()
));