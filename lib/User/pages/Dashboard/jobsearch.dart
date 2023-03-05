import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobSearch extends StatelessWidget {
  const JobSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Search"),
      ),
      body: JVacancyList(),
    );
  }
}

class JVacancyList extends StatefulWidget {
  @override
  _JVacancyListState createState() => _JVacancyListState();
}

class _JVacancyListState extends State<JVacancyList> {
  List<DocumentSnapshot> _documentList = [];
  List<DocumentSnapshot> _searchedDocumentList = [];

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('job_search');

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    _collectionReference.get().then((QuerySnapshot querySnapshot) {
      setState(() {
        _documentList = querySnapshot.docs;
        _searchedDocumentList = querySnapshot.docs;
      });
    });
  }

  void _runSearch(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _searchedDocumentList = List.from(_documentList);
      });
      return;
    }
    List<DocumentSnapshot> tempList = [];
    _documentList.forEach((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      String title = data['title'].toString().toLowerCase();
      String subtitle = data['details'].toString().toLowerCase();
      // String description = data['description'].toString().toLowerCase();  || description.contains(searchText.toLowerCase())
      if (title.contains(searchText.toLowerCase()) ||
          subtitle.contains(searchText.toLowerCase())) {
        tempList.add(document);
      }
    });
    setState(() {
      _searchedDocumentList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (String searchText) {
            _runSearch(searchText);
          },
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchedDocumentList.length,
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot document = _searchedDocumentList[index];
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
