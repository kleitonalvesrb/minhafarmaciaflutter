import 'package:flutter/material.dart';
import 'package:minhafarmacia/src/partials/customappbar.dart';
import 'package:minhafarmacia/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class HomePage extends StatelessWidget {
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
            title: "Minha Farmácia",
            hidePlus: true),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: const Center(child: Text('Testando 1,2,3 .....')),
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