import 'package:flutter/material.dart';
import 'package:incidents/pages/incident_report_page.dart';
import 'package:incidents/webservices/webservice.dart';
import 'package:incidents/widgets/incident_list.dart';
import 'package:provider/provider.dart';

import '../models/incident.dart';
import '../utils/constants.dart';
import '../view_models/incident_list_view.dart';
import '../view_models/report_incident_view_model.dart';

class IncidentListPage extends StatefulWidget {
  const IncidentListPage({Key? key}) : super(key: key);

  @override
  State<IncidentListPage> createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {


  @override
  void initState() {
    // TODO: implement initState

    status = Status.loading;
    super.initState();
  }



  void _populateAllIncidents()
  {
    Provider.of<IncidentListViewModel>(context,listen: false).getAllIncidents();
  }

 Widget _updateUI(IncidentListViewModel vm)
 {
   switch(status)
   {
     case Status.loading :
        return CircularProgressIndicator();


     case Status.success :
       return IncidentList(incidents: vm.incidents);

       default:
       return Text("No widget to build");

   }
 }


  @override
  Widget build(BuildContext context) {
    _populateAllIncidents();
    //Provider.of<IncidentListViewModel>(context,listen: false).getAllIncidents();
    final vm = Provider.of<IncidentListViewModel>(context);
    var webService = WebService();
    
    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.center, child: Text("Incidents")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

         //   Image(image:NetworkImage("http://192.168.1.8:3000/uploads/ggff.jpg")),



            FutureBuilder<List<Incident>> (
                future: webService.getAllIncidents(),
                builder: (context, snapshot)
                {

                if (snapshot.hasData) {
                  status=Status.success;
                  return _updateUI(vm);
                }
                else
                  {
                    status=Status.loading;
                    return _updateUI(vm);
                  }

                }

            ),
            
            
          //  _updateUI(vm),
          // IncidentList(incidents: vm.incidents),



            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  
                  onPressed: () 
                  {


                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ChangeNotifierProvider(
                              create: (context) => ReportIncidentViewModel(),
                              child: const IncidentReportPage(),
                            ),
                            //IncidentReportPage(),
                        fullscreenDialog: true

                        )
                        );

                   // _populateAllIncidents();
                  },
                  child: Icon(Icons.add),
                  
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
