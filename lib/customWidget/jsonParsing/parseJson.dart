import 'package:app_one/customWidget/jsonParsing/studentDefinition.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class parseJsonWidget extends StatefulWidget{

  _parseJsonWidgetstate createState()=> _parseJsonWidgetstate();

}

class _parseJsonWidgetstate extends State<parseJsonWidget>{
  String title =" Hi";

  void updatetitle(){
    var parsedJson = json.decode(studentJson) as List; // as List can be removed
    // studentDetails st = studentDetails.fromJson(parsedJson);
    List<studentDetails> stl = List.generate(parsedJson.length,
            (index) => studentDetails.fromJson(parsedJson[index]));

    print(stl);
    
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return(
    Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              color: Colors.amberAccent,
              child:TextField(
                decoration: InputDecoration(labelText: "Enter title"),
                onChanged: (text)=>{title = text},
              )
            )
          ),
          ElevatedButton(onPressed: updatetitle, child: Text("Click"))
        ]
      )
    )
    );
  }
}