import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../view_models/incident_list_view.dart';
import '../view_models/incident_view_model.dart';
import 'package:path/path.dart';

class IncidentList extends StatelessWidget {



  final List<IncidentViewModel> incidents;

  const IncidentList({Key? key, required this.incidents}) : super(key: key);



  @override
  Widget build(BuildContext context) {



    return Flexible(
      child: ListView.builder(
        
          itemCount: incidents.length,
          itemBuilder: (context, index)   {


          //  File file = File(incidents[index].imageURL);
            // final fileName = basename(file.toString().trim());
           // final url1 = "http://$ip:3000/${incidents[index].imageURL}";
           // print("NETWORK_IMG: $url1");

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading:

                SizedBox(
                  width: 100,
                  child: Image.network(
                    "$ip:3000${incidents[index].imageURL}",


                  ),
                ),

                    /*
                     CachedNetworkImage(
                  imageUrl: "http://localhost:3000/uploads/ggff.jpg",
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                     */


                //Image.network("http://localhost:3000/uploads/ggff.jpg"),
                title:  Text(incidents[index].title),
              ),
            );
          }),
    );
  }
}


