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

    datos = datos.isNotEmpty ? datos : ModalRoute.of(context).settings.arguments;
    print(datos);


    //Establecemos el fondo
    String background = datos['haySol'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = datos['haySol'] ? Colors.cyan : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$background'),
                  fit: BoxFit.cover //Esto es para que rellene el container con la foto
              )
            ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0.0,0.0),
            
            child: Column(

              children: <Widget>[
              FlatButton.icon(
                onPressed: () async{
                  //La tarea de eleguir ubicacion y hacer pop a home es una
                  //tarea por la que hay que esperar
                  dynamic resultado = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    //sobreescribimos el Map datos
                    datos = {
                      'time' : resultado['time'],
                      'ubicacion' : resultado['ubicacion'],
                      'haySol' : resultado['haySol'],
                      'bandera' : resultado['bandera']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.deepOrangeAccent
                ),
                label: Text(
                    "Elige un lugar",
                    style: TextStyle(
                      color:Colors.grey[100],
                      fontSize: 20.0,
                    ),
                )
              ),

              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    datos['ubicacion'],
                    style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      color: Colors.grey[200]
                    )
                  )
                ],
              ),

              Divider(
                color : Colors.white,
                height: 20,
                indent: 100,
                endIndent: 100,
              ),

              Text(
                datos['time'],
                style: TextStyle(
                  fontSize: 67.0,
                  color:Colors.grey[200]
                ),
              )



            ],
        ),
      ),
          )
      )



    );
  }
}

