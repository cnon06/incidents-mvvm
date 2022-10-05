import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:incidents/pages/incident_list_page.dart';
import 'package:provider/provider.dart';

import 'view_models/incident_list_view.dart';
import 'widgets/incident_list.dart';


/*
void main() {
  runApp(const MyApp());
}
 */

late List<CameraDescription> cameras;

Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:

            ChangeNotifierProvider(
              create: (context) => IncidentListViewModel(),
              child: IncidentListPage(),
            ),



    //  const IncidentListPage(),
    );
  }
}

