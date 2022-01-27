import 'package:flutter/material.dart';
import 'loginWidgetOne.dart';

class rootWidgetOne extends StatelessWidget{

  //var
  String Email = "";
  String Password = "";

  void handle_onGetData(String email, String pass, BuildContext conxt){
    Email = email;
    Password = pass;

    ScaffoldMessenger.of(conxt)
        .showSnackBar(SnackBar(content: Text("Welcome ${Email}")));
  }

  // initilaize text controller
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  //
  // handleLogin(context){
  //   //Show Snackbar
  //   ScaffoldMessenger.of(context).
  //   showSnackBar(SnackBar(content:Text("Welcome ${email.text}"),
  //     duration: Duration(seconds: 2),));
  //
  //   // Clear state of text fields
  //   email.text ="";
  //   password.text="";
  // }



  @override
  Widget build(BuildContext context){
    return(Scaffold(
      appBar: AppBar(title: Text("Welcome to Widget Comm.",
      style: TextStyle(fontSize: 30, color:Colors.green)),),
      body: loginWidgetOne(onGetData: handle_onGetData ),
    ));
  }
}