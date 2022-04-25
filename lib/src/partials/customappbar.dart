import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({
  GlobalKey<ScaffoldState> ?scaffoldKey,
  BuildContext ?pageContext,
  String title = '',
  bool hidePlus = false,
  bool showBack = false}){
  return AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.blue,
    elevation: 0,
    centerTitle: false,
    title: Text(title, style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.bold,
    ),
    ),
    leading: IconButton(icon:const Icon(Icons.menu), onPressed: (){
      scaffoldKey!.currentState!.openDrawer();
    },),
    actions: [ 
      !hidePlus ?
      IconButton(onPressed: (){
        Navigator.pushNamed(pageContext!, '/addmedicamento');
      }, icon: const Icon(Icons.add, size: 35,),
      ): Container(),
    ],
  );
}