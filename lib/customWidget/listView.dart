import 'package:flutter/material.dart';

class lvWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return(Scaffold(
     appBar: AppBar(title: Text("List View"),),
     body: ListView(children: [
       lstItemWidget("Name 1", "Avtar 1"),
       lstItemWidget("Name 2", "Avtar 2"),
       lstItemWidget("Name 3", "Avtar 3"),
     ])
    ));
  }
}

class lstItemWidget extends StatefulWidget{
  String Name = "";
  String Tag = "";
  lstItemWidget(String nm, String tg){
    Name = nm;
    Tag = tg;
  }

  _lstItemWidgetState createState() => _lstItemWidgetState();
}

class _lstItemWidgetState extends State<lstItemWidget>{

  void showSnack(BuildContext conxt){
    ScaffoldMessenger.of(conxt).showSnackBar(
      SnackBar(content: Text("Welcome ${widget.Name}"),
      duration: Duration(seconds: 1),
    ));
  }
  @override
  Widget build(BuildContext context){
    return(
      Row(children:[
        Padding(padding: EdgeInsets.all(3),
            child: Row(children:[
              GestureDetector(onTap: ()=>showSnack(context),
                child: CircleAvatar( backgroundColor: Colors.brown.shade800,
                  radius: 50,
                  child: Text(widget.Tag)),),
            Padding(padding: EdgeInsets.all(5),
                child: Text(widget.Name, style: TextStyle(fontSize: 20, color: Colors.redAccent))
            ),
          ])
        )]
      )
    );
  }
}