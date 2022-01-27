import 'package:flutter/material.dart';
import 'multiWidget.dart';

class detailView extends StatelessWidget{

  studentDetails student = studentDetails();

  detailView({required this.student});

  @override
  Widget build(BuildContext context){
    return Material(
      child:
        Column(children:[
          Text("Welcomne ${student.name}",
              style: TextStyle(color: Colors.purple)),
          Text("Initials ${student.init}",
              style: TextStyle(color: Colors.purple)),
          Text("College ${student.college}",
              style: TextStyle(color: Colors.purple)),
          Text("Branch ${student.branch}",
              style: TextStyle(color: Colors.purple)),
          ElevatedButton(onPressed: ()=> {Navigator.pop(context, "Presnt")}, child: Text("Present")),
          ElevatedButton(onPressed: ()=> {Navigator.pop(context, "Absent")}, child: Text("Absent"))

        ])
    );
  }
}