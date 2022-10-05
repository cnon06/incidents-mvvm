

class Incident {
  final String title;
  final String description;
  final String imageURL;

  Incident({required this.title, required this.description, required this.imageURL});

  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(title: json['title'], description: json['description'], imageURL: json['imageURL']);
  }

}




/*
class Incident {
  final String title;
  final String description;


  Incident({required this.title, required this.description,});

  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(title: json['title'], description: json['description'],);
  }

}

 */


