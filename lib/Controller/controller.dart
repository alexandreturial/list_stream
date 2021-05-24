import 'dart:async';

import 'package:list_mvvm/Model/model.dart';

class HomeController{
  HomeModel _model = HomeModel();

  Future<List<int>> get lista => _model.lista;

  StreamController<List<int>> streamList = StreamController();

  void loadlists(){
    _model.loadList();
    _model.lista.then((value){
      streamList.add(value);
    });
    

  }
  
}