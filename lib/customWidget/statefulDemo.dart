import 'package:flutter/material.dart';

class statefulDemo extends StatefulWidget{

  _statefulDemostate createState()=> _statefulDemostate();

}

// class _statefulDemostate extends State<statefulDemo>{
//
//   String title = "";
//
//   void updateTiltle(String Text){
//     setState(() {
//       title = Text;
//     });
//   }
//   @override
//   Widget build(BuildContext context){
//
//     return(Scaffold(
//       appBar: AppBar(title: Text(title),),
//       body: Padding( padding: EdgeInsets.all(10),
//         child: Container(color: Colors.red,
//           child: TextField(
//             decoration: InputDecoration(labelText: "Enter Title"),
//             onChanged: updateTiltle,),
//         ),
//     ),
//     ));
//   }
// }

class _statefulDemostate extends State<statefulDemo>{

  String title = "";

  void updateTiltle(String Text){
    setState(() {
      title = Text;
    });
  }
  @override
  Widget build(BuildContext context){

    return(Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Padding( padding: EdgeInsets.all(10),
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: "Title"),
            onChanged: (Text)=> {title = Text},),
            ElevatedButton(onPressed: ()=> setState(() {}), // updateTitle can be called here with title agument
              child: Icon(Icons.login, size: 28, color: Colors.amber),
            )
          ],
        )
      ),
    ));
  }
}