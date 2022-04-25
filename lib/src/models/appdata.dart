import 'package:flutter/material.dart';

class AppData with ChangeNotifier{
  var medicamentos = [];

  void setMedicamentos(newMedicamento){
    medicamentos = newMedicamento;
    notifyListeners();
  }
}