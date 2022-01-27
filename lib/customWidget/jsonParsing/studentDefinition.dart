class studentDetails{
  String name ="";
  String init ="";
  String course ="";
  String college ="";
  String branch ="";
  List<String> ? hobby;

  studentDetails();

  studentDetails.withData(
      {required this.name, required this.init, this.college="", this.branch="", this.hobby});

  factory studentDetails.fromJson(Map<String, dynamic>parsedJson){
    return studentDetails.withData(name: parsedJson['name'], init: parsedJson['id'],
    hobby: List.from(parsedJson['hobby']) );
}

  @override
  String toString() {
    return ("Name = $name - $init + $hobby");
  }
}

String studentJson ='''
  [
    { "name": "n1",
      "id": "i1",
      "course": "c1",
      "hobby": ["Gaming","Reading","Cricket"]
    } ,
    
    { "name": "n2",
      "id": "i2",
      "course": "c2",
      "hobby": ["Vlogging","Reading"]
    } ,
    
    { "name": "n3",
      "id": "i3",
      "course": "c3",
      "hobby": ["Blogging","Cricket"]
    }    
  ]
''';