import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Custom imports
// [do not remove unused  imports coz they are used for testing purpose]
// import 'package:app_one/customWidget/loginWidget.dart';
import 'customWidget/loginWidget.dart';
import 'customWidget/statefulDemo.dart';
import 'customWidget/listView.dart';
import 'customWidget/entryForm.dart';
import 'customWidget/jsonParsing/parseJson.dart';
import 'customWidget/widgetInteraction/rootWidgetOne.dart';
import 'package:app_one/customWidget/jsonParsing/complexJsonParsing.dart';
import 'customWidget/BLE_exp/BLE_Basic_Driver.dart';

void main() {
  runApp(
      MaterialApp(
          home: bleDeviceListWidget()
          // home: entryForm()
      )
  );
}

// Simple demo
class rootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyRowWidget("Row 1"),
            MyRowWidget("Row 2"),
            MyRowWidget("Row 3")
          ]
        )
    );
  }
}

class MyRowWidget extends StatelessWidget {

  MyRowWidget(String n){
    msg = n;
  }

  String msg = "";

  @override
  Widget build(BuildContext context){
    return (
        Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(msg,
                style: TextStyle(fontSize:28,
                    decoration: TextDecoration.none)
              ),
              ElevatedButton(onPressed: ()=>{Fluttertoast.showToast(msg: msg)}, child: Text("Click Me"))
            ],
      )
    );
  }
}