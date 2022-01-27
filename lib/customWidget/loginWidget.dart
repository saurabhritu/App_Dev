import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginWidget extends StatelessWidget {

  String userEmail = "";
  String password = "";

  void handleLogin(){
    if (userEmail.contains("@xyz") == true) {
      Fluttertoast.showToast(msg: userEmail);
    }
    else{
      Fluttertoast.showToast(msg: "Invalid Email");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material (
      child: Padding( padding: EdgeInsets.all(10),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(decoration: InputDecoration(
                hintText: "Enter Email",
                labelText: "Email"
              ),onChanged: (Text)=>{userEmail = Text},),
              TextField(obscureText: true,
                decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password"
              ),onChanged: (Text)=> {password = Text},),
              ElevatedButton(onPressed: handleLogin,
                child: Icon(Icons.login, size: 28, color: Colors.amber),
              )
            ],
          )
      )
    );
  }
}

class loginWidgetController extends StatelessWidget {
  // used text editing controler instead of onChanged
  TextEditingController textUser = TextEditingController();
  TextEditingController textPass = TextEditingController();

  String userEmail = "";
  String password = "";

  void handleLogin(BuildContext context){
    // code to execute
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Welcome to IoT ${textUser.text}"), duration: Duration(seconds: 3),));
    textUser.text = "";
    textPass.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Material (
        child: Padding( padding: EdgeInsets.all(10),
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(decoration: InputDecoration(
                    hintText: "Enter Email",
                    labelText: "Email"
                ),controller: textUser),
                TextField( obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password"
                  ),controller: textPass),
                ElevatedButton(onPressed: ()=>handleLogin(context),
                  child: Icon(Icons.login, size: 28, color: Colors.amber),
                )
              ],
            )
        )
    );
  }
}


class extendedLoginWidget extends StatelessWidget{

  Widget login = loginWidgetController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text("Welcom to IoT",
          style: TextStyle(fontSize: 20,color: Colors.limeAccent,),)
      )
      ),
      body: login,
      drawer: Drawer(child: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("App Home"),
        Text("Description"),
        Text("Version 0.1")
      ]
      )
      )
    );
  }
}