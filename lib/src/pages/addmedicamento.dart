import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minhafarmacia/src/partials/customappbar.dart';
import 'package:minhafarmacia/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddMedicamento extends StatefulWidget {
  @override
  _AddMedicamento createState() => _AddMedicamento();
}

class _AddMedicamento extends State<AddMedicamento> {
/**
 * 
 */
  final _picker = ImagePicker();
  late File _selectImage;
  bool _inProcess = false;

  File? _image;

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> barCodeScan() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.DEFAULT);
    print(barcodeScanRes);
  }

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
            title: "Adicionar Medicamento",
            hidePlus: true),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 10, top: 10, right: 10, bottom: 30),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        // doSearch(context, text);
                      },
                      decoration: InputDecoration(
                        hintText: 'Digite o código de barras',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            print('abrir a camera');
                            barCodeScan();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.blue,
                        border: Border.all(color: Colors.blue)),
                    child: TextButton(
                      child: _image == null
                          ? const Icon(
                              Icons.photo,
                              size: 70,
                              color: Colors.black,
                            )
                          : Image.file(_image!, fit: BoxFit.cover),
                      onPressed: () {
                        _openImagePicker();
                        print("teste2S");
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: const TextField(
                      decoration: InputDecoration(label: Text('Nome')),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: const TextField(
                      decoration:
                          InputDecoration(label: Text('Pricípio Ativo')),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: const TextField(
                      decoration: InputDecoration(label: Text('Fabricante')),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: const TextField(
                      decoration: InputDecoration(label: Text('CNPJ')),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: const TextField(
                      decoration: InputDecoration(label: Text('Controlado')),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: const TextField(
                      decoration:
                          InputDecoration(label: Text('Quantidade de dias')),
                    ),
                  ),
                ],
              ),
            )
          ],
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
