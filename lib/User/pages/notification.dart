import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vacancy extends StatelessWidget {
  const Vacancy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vacancy"),
      ),
      body: NotificationPage(),
    );
  }
}

/*
class NotificationPage extends StatelessWidget {
  final List<NotificationData> notifications = [    
  NotificationData('Notification 1', 'Notification details 1'),    
  NotificationData('Notification 2', 'Notification details 2'),    
  NotificationData('Notification 4', 'Notification details 3'), 
  NotificationData('Notification 5', 'Notification details 3'), 
  NotificationData('Notification 6', 'Notification details 3'), 
  NotificationData('Notification 7', 'Notification details 3'), 
  NotificationData('Notification 8', 'Notification details 3'), 
  
  
  ] ;  // Add more notifications as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Notifications'),
      // ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),//the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.notifications),
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].details),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationDetailsPage(notifications[index]),
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

class NotificationData {
  final String title;
  final String details;

  NotificationData(this.title, this.details);
}

class NotificationDetailsPage extends StatelessWidget {
  final NotificationData notificationData;

  NotificationDetailsPage(this.notificationData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(notificationData.details),
          ],
        ),
      ),
    );
  }
}*/

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<DocumentSnapshot> _documentList = [];

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('notifications');

  @override
  void initState() {
    super.initState();
    _loadData();
    // DocumentReference copyFrom =
    //     FirebaseFirestore.instance.collection('internship').doc('204');
    // DocumentReference copyTo =
    //     FirebaseFirestore.instance.collection('notifications').doc('204');
    // copyFrom.get().then((value) => {copyTo.set(value.data())});
  }

  void _loadData() {
    _collectionReference.get().then((QuerySnapshot querySnapshot) {
      setState(() {
        _documentList = querySnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Firestore Data List'),
      // ),
      body: ListView.builder(
        itemCount: _documentList.length,
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot document = _documentList[index];
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          return ListTile(
            leading: Icon(Icons.notifications),
            // title:Text("vacancy posted"),
            title: Text("Vacancy posted"),
            subtitle: Text(data['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(document: document),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final DocumentSnapshot document;

  DetailsPage({required this.document});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job title:" + data['title'],
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Details: " + data['details'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Description: " + data['description'],
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'V ID: ${data['vid']}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(70),
                    child: Semantics(
                      label: "Apply button",
                      child: ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontStyle: FontStyle.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.all(18),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Applied successfully"),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                  top: 60.0, left: 20.0, right: 20.0),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
