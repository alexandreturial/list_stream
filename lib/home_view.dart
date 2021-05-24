import 'package:flutter/material.dart';
import 'package:list_mvvm/Controller/controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: StreamBuilder<List<int>>(
                  stream: controller.streamList.stream,
                  builder: (context, snapshot){
                    if(snapshot.connectionState != ConnectionState.active){
                      return CircularProgressIndicator();
                    }
                    if(snapshot.hasData){
                      var array = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: array.length,
                        itemBuilder: (context, index){
                          return Center(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 100,
                              height: 30,
                              child: Center(child: Text('$index'),),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                              ),
                            ),
                          );
                        }
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
            ElevatedButton(
              child: Text('load'),
              onPressed: (){
                setState(() {
                  controller.loadlists();
                });
              },
            )
          ],
        )
      ),
    );
  }
}