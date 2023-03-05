import 'package:flutter/material.dart';

class AppStatus extends StatelessWidget {
  const AppStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application status"),
      ),
      body: AppStatusPage(),
    );
  }
}

class AppStatusPage extends StatelessWidget {
  final List<AppStatusData> AppStatuss = [
    AppStatusData('Manager', 'Applied on 24.5.23',
        '5 years experience in sales ', 'Experience in execution of projects'),
    AppStatusData(
        'C++ Developer',
        'Applied on 24.5.23',
        '3 years of experience in an IT company',
        'Should Have worked in GUI Development'),
    AppStatusData('Full Stack Developer', 'Applied on 24.5.23',
        '2 years of experience', 'Work from Home'),
    AppStatusData('Accountant', 'Applied on 24.5.23', '4 years of experience',
        'Good in sql'),
    AppStatusData('Salesperson', 'Applied on 24.5.23',
        '2 years of experience in sales', 'Work from Home'),
    AppStatusData('Back End Developer', 'Applied on 24.5.23',
        '3 years of experience', 'Work in Managing Databases'),
    AppStatusData('Graphic designer', 'Applied on 24.5.23',
        '3 years of experience', 'Expert in Photoshop'),
  ]; // Add more AppStatuss as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('AppStatuss'),
      // ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics:
              NeverScrollableScrollPhysics(), //the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: AppStatuss.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.query_stats),
              title: Text(AppStatuss[index].title),
              subtitle: Text(AppStatuss[index].status,style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppStatusDetailsPage(AppStatuss[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class AppStatusData {
  final String title;
  final String status;
  final String details;
  final String description;

  AppStatusData(this.title, this.status, this.details, this.description);
}

class AppStatusDetailsPage extends StatelessWidget {
  final AppStatusData;

  AppStatusDetailsPage(this.AppStatusData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppStatus Details'),
        // backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              AppStatusData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(AppStatusData.details),
            
            SizedBox(height: 16),
            Text(AppStatusData.description),

            SizedBox(height: 16),
            Text(AppStatusData.status,style: TextStyle(fontSize: 20,color: Colors.green),),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   child: Text(
            //     'Apply',
            //     style: TextStyle(
            //         fontSize: 30.0,
            //         color: Colors.white,
            //         fontStyle: FontStyle.normal,
            //         backgroundColor: Colors.green,
                    
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

/*
class ApplicationStatusPage extends StatefulWidget {
  @override
  _ApplicationStatusPageState createState() => _ApplicationStatusPageState();
}

class _ApplicationStatusPageState extends State<ApplicationStatusPage> {
  String currentStatus = "Received";
  List<String> applicationSteps = [    "Received",    "Under Review",    "In Progress",    "Declined",    "Accepted"  ];
  int currentStep = 0;
  Map<String, String> estimatedTimelines = {
    "Received": "2-3 business days",
    "Under Review": "1 week",
    "In Progress": "2-3 weeks",
    "Declined": "N/A",
    "Accepted": "N/A"
  };

  void updateStatus(String newStatus) {
    setState(() {
      currentStatus = newStatus;
      currentStep = applicationSteps.indexOf(newStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Status"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Current Status: $currentStatus",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              value: (currentStep + 1) / applicationSteps.length,
              minHeight: 10.0,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Estimated Timelines:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  for (var step in applicationSteps)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              step,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Text(
                            estimatedTimelines[step] ?? "",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                updateStatus("Under Review");
              },
              child: Text("Update Status"),
            ),
          )
        ],
      ),
    );
  }
}*/
