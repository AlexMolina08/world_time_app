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
      body: SafeArea(
          child:Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0.0,0.0),

          child: Column(

            children: <Widget>[
            FlatButton.icon(
              onPressed: (){
                Navigator.pushNamed(context,'/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text("Elige ubicacion")
            ),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  datos['ubicacion'],
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 2.0
                  )
                )
              ],
            ),

            SizedBox(height: 20.0),

            Text(
              datos['time'],
              style: TextStyle(
                fontSize: 67.0,

              ),
            )



          ],
        ),
      )
      )



    );
  }
}

