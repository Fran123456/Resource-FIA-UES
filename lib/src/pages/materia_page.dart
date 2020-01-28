import 'package:MAT115/src/models/carrera_model.dart';
import 'package:MAT115/src/models/materia_model.dart';
import 'package:flutter/material.dart';
import 'package:MAT115/src/pages/widgets/widgets.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:MAT115/src/pages/widgets/anuncios.dart';
import 'package:MAT115/src/providers/materias_provider.dart';

//materias



class MateriaPage extends StatefulWidget {
  @override
  _MateriaPageState createState() => _MateriaPageState();
}

class _MateriaPageState extends State<MateriaPage> {
  
@override
void initState() {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-4742776392392231~5346828662");
    super.initState();
}


    
@override
  Widget build(BuildContext context) {
     Carrera carreraId = ModalRoute.of(context).settings.arguments;
   /* myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );*/


  return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(35, 37, 57, 1.0),
          title: Text(carreraId.carrera),
        ),
        drawer: Drawer(
        child: misWidgets.barraNav(context),
        ),
        body: Stack(
          children: <Widget>[
            misWidgets.fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                misWidgets.titulos("TODAS LAS MATERIAS", ""),
                _lista(carreraId.id)
                ],
              ),
            )
          ],
        ),
      );

  }


 //Retorna la lista que usaremos en el body
  Widget _lista(int carreraId) {

     return FutureBuilder(
      // future: menuProvider.cargarData(),
      future: materiasProvider.getMaterias(carreraId),
       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
         if(snapshot.hasData){
           return Table(
             children: _listaItems(snapshot.data, context),
           );
         }else if(snapshot.hasError){
           return misWidgets.error();
         }
         return misWidgets.espera();

       },
     );
  }


  //retorna listas
  List<TableRow> _listaItems(List<dynamic> data, BuildContext context){
    final List<TableRow> opciones = [];
    for (Materia op in data) {
      final widgetTemp = TableRow(
        children: [
          crearBtn(context, op)
        ]
      );
     opciones.add(widgetTemp);
    }
    return opciones;
  }


  Widget crearBtn(context, Materia op){
    //filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
     return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, 'unidades', arguments: op);
          },
          child: Container(
          height: 70.0,
          margin: EdgeInsets.all(9.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107,1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 10,),
              CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 20.0,
                child: Icon(Icons.navigate_next, color: Colors.white, size: 18.0 ,),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text(op.titulo, style: TextStyle(color: Colors.pinkAccent, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
              
              Text(op.siglas, style: TextStyle(color: Colors.pinkAccent, fontSize: 12.0),),
              SizedBox(width: 5,),

            ],
          ),
        ),
     );
  }


}


