import 'package:flutter/material.dart';
import 'package:minhafarmacia/src/partials/customappbar.dart';
import 'package:minhafarmacia/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class MedicamentoPage extends StatefulWidget {
  @override
  _MedicamentoPage createState() => _MedicamentoPage();
}

class _MedicamentoPage extends State<MedicamentoPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: "Medicamentos",
            hidePlus: false),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(25, (index) {
              return Container(
                margin: const EdgeInsets.all(5),
                height: 300,
                width: 300,
                color: Colors.red,
                
              );
            }),
          ),
        ),
      ),
    );
  }
}

/*
Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(child: Text('Testando 1,2,3 .....')),
    );
    */