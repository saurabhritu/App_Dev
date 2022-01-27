import 'package:flutter/material.dart';

class loginWidgetOne extends StatelessWidget{

  //var
  String Email = "";
  String Password = "";

  // define text controller
  // TextEditingController email;
  // TextEditingController password;
  // VoidCallback onLoginClick;

  Function(String, String, BuildContext) onGetData;

  // loginWidgetOne({required this.email, required this.password, required this.onLoginClick});
  loginWidgetOne({required this.onGetData});

  @override
  Widget build(BuildContext context){
    return(Material(
      child: Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText:"Email", labelText: "Enter Email"),
            onChanged: (text)=>{Email=text},),
            TextField(obscureText: true,
              decoration:InputDecoration(hintText: "Password", labelText:"Enter Password"),
            onChanged: (text)=> {Password = text},),
            ElevatedButton(onPressed: ()=> {onGetData(Email, Password, context)},
                child: Icon(Icons.login, size: 32, color: Colors.green))
          ]
      )),
    ));
  }
}