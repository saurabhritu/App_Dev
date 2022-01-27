import 'package:app_one/customWidget/multiWidget.dart';
import 'package:flutter/material.dart';
import'detailView.dart';
import'multiWidget.dart';

class lvWidgetlong extends StatelessWidget {
  var childList = List<lstItemWidget>.generate(100, (index) =>
  lstItemWidget("Test ${index+1}", "Tag ${index+1}","Collge ${index+1}", "branch ${index+1}"));

  @override
  Widget build(BuildContext context){
    return(Scaffold(
        appBar: AppBar(title: Text("List View"),),
        body: ListView(children: childList,)
    ));
  }
}

class lstItemWidget extends StatelessWidget{

  studentDetails student = studentDetails();

  // String Name = "";
  // String init = "";
  // String college ="";
  // String branch ="";

  lstItemWidget(String nm, String tg, String clg, String bnch){
    student.name = nm;
    student.init = tg;
    student.college = clg;
    student.branch = bnch;
  }

  // detailView({required this.student});

  void showStudentDetails(BuildContext conxt) async {

    final result = await Navigator.push(conxt, MaterialPageRoute(builder: (conxt)=>detailView(student: student,)))
        .then((result) => ScaffoldMessenger.of(conxt).showSnackBar(
        SnackBar(content: Text("${student.name} is ${result}"),
          duration: Duration(seconds: 3),
        )));


    // ScaffoldMessenger.of(conxt).showSnackBar(
    //     SnackBar(content: Text("${student.name} is ${result}"),
    //       duration: Duration(seconds: 3),
    //     ));
  }
  @override
  Widget build(BuildContext context){
    return(
        Row(children:[
          Padding(padding: EdgeInsets.all(3),
              child: Row(children:[
                GestureDetector(onTap: ()=>showStudentDetails(context),
                  child: CircleAvatar( backgroundColor: Colors.brown.shade800,
                      radius: 50,
                      child: Text(student.init)),),
                Padding(padding: EdgeInsets.all(5),
                    child: Text(student.name, style: TextStyle(fontSize: 20, color: Colors.redAccent))
                ),
              ])
          )]
        )
    );
  }
}


class entryForm extends StatefulWidget{
  _entryFormState createState()=> _entryFormState();
}

class _entryFormState extends State<entryForm>{
  var studentList = <lstItemWidget>[]; // empty list of lstItemWidget

  TextEditingController Name = TextEditingController();
  TextEditingController Initials = TextEditingController();
  TextEditingController college = TextEditingController();
  TextEditingController branch = TextEditingController();

  void updateStudentList(){
    studentList.add(lstItemWidget(Name.text, Initials.text, college.text, branch.text));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context){
    return(Scaffold(
        appBar: AppBar(title: Text("Entry Form")),
        body: Column(children: [
          TextField(decoration: InputDecoration(labelText: "Enter Name"),
              controller: Name),
          TextField(decoration: InputDecoration(labelText: "Enter Initials "),
              controller: Initials),
          TextField(decoration: InputDecoration(labelText: "Enter college "),
              controller: college),
          TextField(decoration: InputDecoration(labelText: "Enter branch "),
              controller: branch),
          ElevatedButton(onPressed: updateStudentList, child: Text("Click")),
          Expanded(child: ListView.builder(itemCount: studentList.length,
          itemBuilder: (context,index){
            return lstItemWidget(studentList[index].student.name, studentList[index].student.init, studentList[index].student.college, studentList[index].student.branch);
          }
          ))
        ]
        )
    )
    );
  }
}