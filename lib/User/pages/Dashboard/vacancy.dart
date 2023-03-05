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
      body: VacancyList(),
    );
  }
}

/*
class VacancyPage extends StatelessWidget {
  final List<VacancyData> Vacancys = [
    VacancyData('Manager', '5 years experience in sales ',
        'Experience in execution of projects'),
    VacancyData('C++ Developer', '3 years of experience in an IT company',
        'Should Have worked in GUI Development'),
    VacancyData(
        'Full Stack Developer', '2 years of experience', 'Work from Home'),
    VacancyData('Accountant', '4 years of experience', 'Good in sql'),
    VacancyData(
        'Salesperson', '2 years of experience in sales', 'Work from Home'),
    VacancyData('Back End Developer', '3 years of experience',
        'Work in Managing Databases'),
    VacancyData(
        'Graphic designer', '3 years of experience', 'Expert in Photoshop'),
  ]; // Add more Vacancys as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Vacancys'),
      // ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics:
              NeverScrollableScrollPhysics(), //the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: Vacancys.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.work),
              title: Text(Vacancys[index].title),
              subtitle: Text(Vacancys[index].details),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VacancyDetailsPage(Vacancys[index]),
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

class VacancyData {
  final String title;
  final String details;
  final String description;

  VacancyData(this.title, this.details, this.description);
}

class VacancyDetailsPage extends StatelessWidget {
  final VacancyData;

  VacancyDetailsPage(this.VacancyData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacancy Details'),
        // backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              VacancyData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            
            SizedBox(height: 16),
            Text(VacancyData.details),
            SizedBox(height: 16),
            Text(VacancyData.description),
            Container(
              margin: EdgeInsets.all(90),
              child: ElevatedButton(
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: 20.0,color: Colors.white, fontStyle: FontStyle.normal),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.all(18),
                ),

                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/



class VacancyList extends StatefulWidget {
  @override
  _VacancyListState createState() => _VacancyListState();
}

class _VacancyListState extends State<VacancyList> {
  List<DocumentSnapshot> _documentList = [];

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('vacancy');

  @override
  void initState() {
    super.initState();
    _loadData();
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
            leading: Icon(Icons.work),
            title: Text(data['title']),
            subtitle: Text(data['details']),
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
    Map<String, dynamic> data = document.data()as Map<String, dynamic>;
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
                  "Job title:"+data['title'],
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Details: "+data['details'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0,),
                Text(
                  "Description: "+data['description'],
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
                          onPressed: () {},
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
