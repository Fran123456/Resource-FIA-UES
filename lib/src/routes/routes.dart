import 'package:MAT115/src/pages/Carreras_page.dart';
import 'package:MAT115/src/pages/colaboradores_page.dart';
import 'package:MAT115/src/pages/contenido_page.dart';
import 'package:MAT115/src/pages/grupo_page.dart';
import 'package:MAT115/src/pages/info_page.dart';
import 'package:MAT115/src/pages/noty_page.dart';
import 'package:MAT115/src/pages/pdf_page.dart';
import 'package:MAT115/src/pages/producto_page.dart';
import 'package:MAT115/src/pages/unidad_page.dart';
import 'package:MAT115/src/pages/youtube_page.dart';
import 'package:flutter/material.dart';
import 'package:MAT115/src/pages/materia_page.dart';
import 'package:MAT115/src/pages/temario_page.dart';

Map<String, WidgetBuilder> routes(){

  return  <String, WidgetBuilder>{
     'productos':(BuildContext context)=>ProductosPage(),
    'colaboradores':(BuildContext context)=>ColaboradoresPage(),
       'materia':(BuildContext context)=>MateriaPage(),
       'carrera':(BuildContext context)=>CarreraPage(),
       'temario':(BuildContext context)=>TemarioPage(),
       'contenido':(BuildContext context)=>ContenidoPage(),
      'video':(BuildContext context)=>YoutubePage(),
       'pdf':(BuildContext context)=>PdfPage(),
       'info':(BuildContext context)=>InfoPage(),
       'unidades':(BuildContext context)=>UnidadesPage(),
       'grupos':(BuildContext context)=>GrupoPage(),
       'noty':(BuildContext context)=>NotyPage(),
     };
}