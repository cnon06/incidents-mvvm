
import 'package:flutter/material.dart';
import 'package:incidents/models/incident.dart';
import 'package:incidents/webservices/webservice.dart';



class ReportIncidentViewModel extends ChangeNotifier
{


   late  String title;
  late String description;
   String? image;

  void imageProcess (String img)
  {image = img;
    notifyListeners();
  }


  Future<void> saveIncident() async
  {

    final incident = Incident(title: title, description: description, imageURL: image!);
    await WebService.saveIncident(incident);
    //TODO
  }



}