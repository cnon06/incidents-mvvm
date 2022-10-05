import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incidents/pages/camera.dart';
import 'package:incidents/view_models/report_incident_view_model.dart';
import 'package:provider/provider.dart';


class IncidentReportPage extends StatelessWidget {
  const IncidentReportPage({Key? key}) : super(key: key);


  void _showPhotoAlbum(ReportIncidentViewModel vm, BuildContext context) async
  {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
   // vm.image =image.path.toString();
    vm.imageProcess(image!.path);
    Navigator.pop(context);
  }


  void _showPhotoSelectionOptions(BuildContext context, ReportIncidentViewModel vm)
  {

    showModalBottomSheet(
        context: context,
        builder: (context)
        {
          return Container(
            height: 150,
            child: Column(
              children:  [
              ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Take a picture."),
                onTap:  () async
                {
               var result =   await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraApp()));
                vm.imageProcess(result);
                Navigator.pop(context);
                 //print("RESULT: $result");
                },
                ),

                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text("Select from photo library."),
                  onTap: (){
                    _showPhotoAlbum(vm, context);
                  },
                ),
              ],
            ),

          );
        });


  }


  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<ReportIncidentViewModel>(context);


    return Scaffold(
      appBar: AppBar(
        title:  const Align(alignment: Alignment.center, child: Text("Report An Incident")),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: vm.image ==null ? Image.asset("images/placeholdder.png") : SizedBox(
                  height: 300,
                  child: Image.file(File( vm.image!)
                  )
              ) ,
            ),

            ElevatedButton(onPressed: (){
              _showPhotoSelectionOptions(context, vm);
            },
                child: Text("Take A Picture"),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),),

            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => vm.title = value,
                  decoration: InputDecoration(
                    labelText: "Enter Text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => vm.description = value,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: "Enter Description"
                ),
              ),
            ),

            ElevatedButton(onPressed: ()
                {
                vm.saveIncident();
                Navigator.pop(context);
                }
                , child: Text("Save"))

          ],

        ),
      ),

    );
  }
}
