import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class JobSearch extends StatelessWidget {
//   const JobSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Job Search"),
//       ),
//       body: MyHomePage(),
//     );
//   }
// }
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<DocumentSnapshot>> _vacancyFuture;
  late Future<List<DocumentSnapshot>> _internshipFuture;
  late List<DocumentSnapshot> allDocs=[];

  List<DocumentSnapshot> _documentList = [];
    List<DocumentSnapshot> _searchedDocumentList = [];

  @override
  void initState() {
    super.initState();
    _vacancyFuture = FirebaseFirestore.instance.collection('vacancy').get().then((snapshot) => snapshot.docs);
    _internshipFuture = FirebaseFirestore.instance.collection('internship').get().then((snapshot) => snapshot.docs);
  }

  void _runSearch(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _searchedDocumentList = List.from(allDocs);
      });
      return;
    }
    List<DocumentSnapshot> tempList = [];
    allDocs.forEach((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      String title = data['title'].toString().toLowerCase();
      String subtitle = data['details'].toString().toLowerCase();
      // String description = data['description'].toString().toLowerCase();  || description.contains(searchText.toLowerCase())
      if (title.contains(searchText.toLowerCase()) ||
          subtitle.contains(searchText.toLowerCase()) ) {
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
      body: FutureBuilder(
        future: Future.wait([_vacancyFuture, _internshipFuture]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final vacancyDocs = snapshot.data![0] as List<DocumentSnapshot>;
          final internshipDocs = snapshot.data![1] as List<DocumentSnapshot>;
          final allDocs = [...vacancyDocs, ...internshipDocs];

          return ListView.builder(
            itemCount: allDocs.length,
            itemBuilder: (BuildContext context, int index) {
              final doc = allDocs[index];
              return ListTile(
                title: Text(doc['title']),
                subtitle: Text(doc['details']),
                onTap: (){},
              );
            },
          );
        },
      ),
    );
  }
}
