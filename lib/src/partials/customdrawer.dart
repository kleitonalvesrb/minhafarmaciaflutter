import 'package:flutter/material.dart';

Widget CustomDrawer({BuildContext? pageContext}){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Minha Farmácia",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica Neue'
            ),
            ),
            Text("Versão 1.0", style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Helvetica Neue'
            ),
            )
          ]
        ),
        decoration: const BoxDecoration(color: Colors.blue),),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/home");
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.medication,
            color: Colors.black,
          ),
          title: const Text('Medicamentos'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/medicamentos");
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.library_books_outlined ,
            color: Colors.black,
          ),
          title: const Text('Receitas'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/receitas");
          },
        ),
      ],
    ),
  );
}