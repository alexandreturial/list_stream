

class HomeModel{
  List<int> list = [];
  Future<List<int>> lista = Future(() =>[]);

  loadList(){
    lista = Future.delayed(
      Duration(seconds: 2),
      (){
        return list..addAll(List<int>.filled(10, 1));
      }
    );
  }
}