import 'package:incidents/models/incident.dart';





class IncidentViewModel {
  final Incident incident;

  IncidentViewModel({required this.incident});

  String get title {
    return incident.title;
  }

  String get description {
    return incident.description;
  }

  String get imageURL {
    return incident.imageURL;
  }

}
