import 'package:list_mvvm/Model/model.dart';

class HomeController{
  HomeModel _model = HomeModel();

  Future<List<int>> get lista => _model.lista;

  void loadlists(){
    _model.loadList();
  }
  
}