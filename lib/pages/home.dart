import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map datos = {};

  @override
  Widget build(BuildContext context) {

    //Recibimos los argumentos de loadingState y los guardamos en
    //el Map datos

    datos = ModalRoute.of(context).settings.arguments;

    print(datos);

    return Scaffold(
      body: SafeArea(child:Column(
        children: <Widget>[
          FlatButton.icon(
            onPressed: (){
              Navigator.pushNamed(context,'/location');
            },
            icon: Icon(Icons.edit_location),
            label: Text("Elige ubicacion")
          )
        ],
      )
      )



    );
  }
}

