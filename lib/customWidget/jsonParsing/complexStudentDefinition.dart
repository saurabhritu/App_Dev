class project{
  String Project_Name ="";
  String Mentor ="";
  String Description ="";
  
  project();
  
  project.withData(
      {required this.Project_Name, required this.Mentor, required this.Description});
  
  factory project.fromJson(Map<String, dynamic> parsedJson){
    return project.withData(Project_Name: parsedJson['Project_Name'],
      Mentor: parsedJson['Mentor'],
      Description: parsedJson['Description'] );
  }
  
}

class studentDetails{
  String name ="";
  String init ="";
  String course ="";
  String college ="";
  String branch ="";
  List<String> ? hobby;
  project ? pro;

  studentDetails();

  studentDetails.withData(
      {required this.name, required this.init, this.college="", this.branch="", this.hobby,required this.pro});

  factory studentDetails.fromJson(Map<String, dynamic>parsedJson){
    return studentDetails.withData(
      name: parsedJson['name'],
      init: parsedJson['id'],
      hobby: List.from(parsedJson['hobby']),
      pro: project.fromJson(parsedJson['project'])
    );
  }

  @override
  String toString() {
    return ("Name = $name - $init + $hobby and working on project ${pro?.Project_Name}");
  }
}

String studentJson ='''
  [
    { "name": "n1",
      "id": "i1",
      "course": "c1",
      "hobby": ["Gaming","Reading","Cricket"],
      "project": {
      "Project_Name": "project 1",
      "Mentor": "Mentor 1",
      "Description": "this is project 1"
      }
    } ,
    
    { "name": "n2",
      "id": "i2",
      "course": "c2",
      "hobby": ["Vlogging","Reading"],
      "project": {
      "Project_Name": "project 2",
      "Mentor": "Mentor 2",
      "Description": "this is project 2"
      }
    } ,
    
    { "name": "n3",
      "id": "i3",
      "course": "c3",
      "hobby": ["Blogging","Cricket"],
      "project": {
      "Project_Name": "project 3",
      "Mentor": "Mentor 3",
      "Description": "this is project 3"
      }
    }    
  ]
''';