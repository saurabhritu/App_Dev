import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

final String ServiceUUID = "";
final String RXUUID = "";
final String TXUUID = "";

class bleCmdCenter extends StatefulWidget{
  BluetoothDevice bledevice;

  bleCmdCenter(this.bledevice);

  _bleCmdCenterState createState()=> _bleCmdCenterState();

}

class _bleCmdCenterState extends State<bleCmdCenter>{

  BluetoothCharacteristic ? RX_Text;
  String deviceValue = "";
  String messageSignal = "";

  @override
  void dispose(){
    super.dispose();
  }

  @override
  void initState(){
    widget.bledevice.connect().then((value) => discoverServices());

    super.initState();
  }

  void discoverServices() async{
    print("fetching Services...");
    widget.bledevice.discoverServices()
        .then((value) => value.forEach((element){
          print("Setvice UUID = ${element.uuid.toString()}");
          if(element.uuid.toString().contains(ServiceUUID.toLowerCase())){
            print("Listing Characteristics...");
            element.characteristics.forEach((characteristic){
              print("${characteristic.uuid} \n ${characteristic.descriptors}");
              if(characteristic.properties.notify){

               characteristic.value.listen((value) {
                 setState(() {
                   deviceValue = utf8.decode(value);
                 });
               });
               characteristic.setNotifyValue(true);
              }
              if(characteristic.properties.write | characteristic.properties.writeWithoutResponse){
                RX_Text = characteristic;
              }
            });
          }
    }));
  }

  void sendData(String msg) async {
    RX_Text?.write(utf8.encode(msg));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("BLERMINAL",
            style: TextStyle(fontSize:20, color: Colors.white ),),
      ),
      body: Container(padding: EdgeInsets.all(20), color: Colors.black54,
          child: Column(
              children: [
                Center(
                    child:Padding(padding: EdgeInsets.fromLTRB(20,20,20,20),
                      child: Text("Read Value = ${deviceValue}",
                          style: TextStyle(fontSize: 20, decoration: TextDecoration.none,
                              color: Colors.white)),)),

                TextField(style: TextStyle(fontSize: 25, color: Colors.white), decoration: InputDecoration(labelText: "Send Message",
                    labelStyle: TextStyle(color: Colors.lightGreen, fontSize: 20),
                    hintText: "Message",
                hintStyle: TextStyle(color: Colors.amber)),
                  onChanged: (text)=>{messageSignal = text},),
                ElevatedButton(onPressed: ()=>{sendData(messageSignal)}, child: Text("Send Data",
                  style: TextStyle(fontSize: 20),))
              ]
          )),
    );
  }
}