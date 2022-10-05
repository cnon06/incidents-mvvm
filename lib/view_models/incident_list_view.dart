
import 'package:flutter/material.dart';
import 'package:incidents/webservices/webservice.dart';

import 'incident_view_model.dart';

class IncidentListViewModel extends ChangeNotifier
{
  List<IncidentViewModel> incidents =[];

  Future <void> getAllIncidents() async
  {
    var webService = WebService();

    final results = await webService.getAllIncidents();
    incidents = results.map((incident) => IncidentViewModel(incident: incident)).toList();
    notifyListeners();
  }


}