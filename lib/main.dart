
import 'package:flutter/material.dart';
import 'package:minhafarmacia/src/models/appdata.dart';
import 'package:minhafarmacia/src/pages/addmedicamento.dart';
import 'package:minhafarmacia/src/pages/home.dart';
import 'package:minhafarmacia/src/pages/medicamentos.dart';
import 'package:provider/provider.dart';


void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppData()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home' : (context) => HomePage(),
        '/medicamentos' : (context) => MedicamentoPage(),
        '/addmedicamento' : (context) => AddMedicamento()
        // '/preload': (context) => PreloadPage(),
        // '/home': (context) => HomePage(),
        // '/search': (context) => SearchPage(),
        // '/continent': (context) => ContinentePage(),
        // '/ListCity': (context) => ListCityPage(),
        // '/city': (context) => CityPage(),
        // '/favorites': (context) => FavoritePage()
      },
      initialRoute: '/home',
    );
  }
}
