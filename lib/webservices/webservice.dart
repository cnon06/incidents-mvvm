


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:incidents/models/incident.dart';

import 'dart:convert';
import 'package:path/path.dart';

import '../utils/constants.dart';








class WebService
{



  static Future <void> saveIncident(Incident incident) async
  {
    //final url = "$ip:3000/incidentsNoImage";
    final url = "$ip:3000/incidents";
    File file = File(incident.imageURL);
    final fileName = basename(file.toString().trim());
    print("Base Name:  $fileName");

    FormData formData = FormData.fromMap({
      "title": incident.title,
      "description": incident.description,
      "image": await MultipartFile.fromFile(incident.imageURL, filename:fileName),

    });

    await Dio().post(url,data: formData);



/*
 await Dio().post(
    url,
    data: {"title": incident.title, "description": incident.description, },
        options: Options(contentType: "application/x-www-form-urlencoded")
    );
 */


  }


Future <List<Incident>> getAllIncidents() async
  {
    final url = "$ip:3000/incidents";


  final response = await Dio().get(url);



    if(response.statusCode == 200 )
      {

       final Iterable json = response.data;

        return json.map((incident) => Incident.fromJson(incident)).toList();

      }
    else
      {
        final  data = jsonDecode(response.data) ;

        throw Exception("Unable to get exception $data");
      }

  }



}