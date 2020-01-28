import 'package:MAT115/src/models/temario_model.dart';
import 'package:MAT115/src/models/unidades_model.dart';
import 'package:MAT115/src/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:MAT115/src/providers/temario_provider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:MAT115/src/pages/widgets/anuncios.dart';


class TemarioPage extends StatefulWidget {
  @override
  _TemarioPageState createState() => _TemarioPageState();
}

class _TemarioPageState extends State<TemarioPage> {
  
@override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-4742776392392231~5346828662");
    super.initState();
  }

 
 @override
   Widget build(BuildContext context) {


    /*  myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );*/

     Unidad unidadId = ModalRoute.of(context).settings.arguments;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(35, 37, 57, 1.0),
          title: Text(unidadId.titulo),
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
                misWidgets.titulos("TEMAS", ""),
                _lista(unidadId.id)
                ],
              ),
            )
          ],
        ),
      );

   }

//Retorna la lista que usaremos en el body
  Widget _lista(int unidadId) {

     return FutureBuilder(
      // future: menuProvider.cargarData(),
      future: temariosProvider.getTemarios(unidadId),
       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
         if(snapshot.hasData){
           return Table(
             children: _listaItems(snapshot.data, context),
           );
         }else if (snapshot.hasError){
            return misWidgets.error();
         }else {
            return misWidgets.espera();
         }
       },
     );
  }


   //retorna listas
 //retorna listas
   List<TableRow> _listaItems(List<dynamic> data, BuildContext context){
    final List<TableRow> opciones = [];
    for (Temario op in data) {
      final widgetTemp = TableRow(
        children: [
          crearBtn(context, op)
        ]
      );
     opciones.add(widgetTemp);
    }
    return opciones;
  }


  Widget crearBtn(context, Temario op){
    //filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
     return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, 'contenido', arguments: op);
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
                child: Text(op.titulo, style: TextStyle(color: Colors.pinkAccent, fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
              
            ],
          ),
        ),
     );
  }




}







