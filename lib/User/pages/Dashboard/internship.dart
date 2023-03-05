/*import 'package:flutter/material.dart';

class Internship extends StatelessWidget {
  const Internship({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internship"),
      ),
      body: InternshipPage(),
    );
  }
}

class MyApp_intern extends StatelessWidget {
  const MyApp_intern({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: InternshipPage(),
    );
  }
}

class InternshipPage extends StatelessWidget {
  final List<InternshipData> internships = [
    InternshipData(
        'Marketing Intern',
        'Duration: 3-6 months',
        'Location: Remote/Online \n\n\nCompensation: Unpaid, but may be eligible for academic credit\n\n\nJob Description: \n\nAlpha-Tech is seeking a motivated and enthusiastic Marketing Intern to assist with various marketing and communication tasks. The ideal candidate will have a strong interest in marketing and a willingness to learn new skills. \n\n\n '
            'Responsibilities:\n\n'
            '1. Assist with the development and execution of marketing campaigns across various channels (social media, email, etc.)\n'
            '2. Help create and manage content for the companys blog and social media platforms\n'
            '3. Conduct research on industry trends and competitor analysis\n'
            '4.Assist with the planning and execution of events and webinars\n'
            '5. Provide support for other marketing and communication tasks as needed\n\n\n'
            'Qualifications:\n\n'
            '1.Currently enrolled in a Bachelors or Masters program in Marketing, Communications, or a related field\n'
            '2.Strong written and verbal communication skills\n'
            '3.Familiarity with social media platforms (Twitter, Facebook, LinkedIn, etc.)\n'
            '4.Strong organizational and time management skills\n'
            '5.Ability to work independently and as part of a team\n'),
    InternshipData(
        'Software Engineering Intern',
        'Duration: 3-6 months',
        'Compensation: Paid hourly\n\n'
            'Job Description:\n\n'
            'Alpha-Tech is seeking a motivated Software Engineering Intern to assist with the development and maintenance of our software products. The ideal candidate will have a strong interest in software engineering and a willingness to learn new skills.\n\n\n'
            'Responsibilities:\n\n'
            '1.Assist with software development and testing\n'
            '2.Collaborate with the engineering team to identify and resolve bugs and other issues\n'
            '3.Conduct research on new technologies and software development best practices\n'
            '4.Assist with the development of software documentation\n\n\n'
            'Qualifications:\n\n'
            '1.Currently enrolled in a Bachelors or Masters program in Computer Science or a related field\n'
            '2.Strong programming skills in one or more languages (e.g. Java, Python, C++)\n'
            '3.Familiarity with software development tools and methodologies\n'
            '4.Strong problem-solving and analytical skills\n'
            '5.Ability to work independently and as part of a team\n'),
    InternshipData(
        'Graphic Design Intern',
        'Duration: 3-6 months',
        'Compensation: Unpaid, but may be eligible for academic credit\n\n\n'
            'Job Description:\n\n'
            'Alpha-Tech is seeking a motivated Graphic Design Intern to assist with the creation of visual content for our clients. The ideal candidate will have a strong interest in graphic design and a willingness to learn new skills.\n\n\n'
            'Responsibilities:\n\n'
            '1.Assist with the creation of visual content for social media, websites, and other platforms\n'
            '2.Collaborate with the design team to brainstorm and develop new ideas\n'
            '3.Conduct research on design trends and best practices\n'
            '4.Assist with the preparation of design presentations and client proposals\n\n\n'
            'Qualifications:\n\n'
            '1.Currently enrolled in a Bachelors or Masters program in Graphic Design or a related field\n'
            '2.Proficiency in design software (e.g. Adobe Creative Suite)\n'
            '3.Strong design and typography skills\n'
            '4.Familiarity with design trends and best practices\n'
            '5.Ability to work independently and as part of a team\n'),
    InternshipData(
        'Business Development Intern',
        'Duration: 3-6 months',
        'Compensation: Paid hourly\n\n\n'
            'Job Description:\n\n'
            'Alpha-Tech is seeking a motivated Business Development Intern to assist with the identification and pursuit of new business opportunities. The ideal candidate will have a strong interest in business development and a willingness to learn new skills.\n\n\n'
            'Responsibilities:\n\n'
            '1.Assist with market research and analysis to identify potential business opportunities'
            ''
            '2.Collaborate with the sales and marketing teams to develop sales strategies and proposals'
            ''
            '3.Assist with the preparation of client presentations and proposals'
            ''
            '4.Attend client meetings and networking events'
            ''
            'Qualifications:'
            ''
            '1.Currently enrolled in a Bachelors or Masters program in Business Administration or a related field'
            '2.Strong analytical and research skills'
            '3.Excellent written and verbal communication skills'
            '4.Familiarity with sales and marketing strategies'
            '5.Ability to work independently and as part of a team'),
    InternshipData(
        'Data Science Intern',
        'Duration: 3-6 months',
        'Compensation: Paid hourly\n\n\n'
            'Job Description:\n\n'
            'JKL Analytics is seeking a motivated Data Science Intern to assist with the analysis and interpretation of large data sets. The ideal candidate will have a strong interest in data science and a willingness to learn new skills.\n\n\n'
            'Responsibilities:\n\n'
            '1.Assist with data collection, cleaning, and analysis\n'
            '2.Collaborate with the data science team to develop statistical models and algorithms\n'
            '3.Conduct research on new data analysis techniques and tools\n'
            '4.Assist with the preparation of data visualizations and reports\n\n\n'
            'Qualifications:\n\n'
            '1.Currently enrolled in a Bachelors or Masters program in Data Science, Computer Science, or a related field\n'
            '2.Strong programming skills in Python, R, or another language commonly used in data science\n'
            '3.Familiarity with statistical modeling and machine learning techniques\n'
            '4.Excellent problem-solving and analytical skills\n'
            '5.Ability to work independently and as part of a team\n'),
    InternshipData(
        'Human Resources Intern',
        'Duration: 3-6 months',
        'Compensation: Unpaid, but may be eligible for academic credit\n\n\n'
            'Job Description:\n\n'
            'Alpha-Tech is seeking a motivated Human Resources Intern to assist with various HR tasks. The ideal candidate will have a strong interest in human resources and a willingness to learn new skills.\n\n\n'
            'Responsibilities:\n\n'
            'Assist with recruiting and onboarding processes\n'
            'Conduct research on HR trends and best practices\n'
            'Help develop and implement HR policies and procedures\n'
            'Provide support for other HR tasks as needed\n\n\n'
            'Qualifications:\n\n'
            'Currently enrolled in a Bachelors or Masters program in Human Resources, Business Administration, or a related field\n'
            'Strong communication and interpersonal skills\n'
            'Familiarity with HR practices and procedures\n'
            'Excellent organizational and time management skills\n'
            'Ability to work independently and as part of a team'),
  ]; // Add more internships as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          physics:
              NeverScrollableScrollPhysics(), //the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: internships.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.workspace_premium),
              title: Text(internships[index].title),
              subtitle: Text(internships[index].details),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        InternshipDetailsPage(internships[index]),
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

class InternshipData {
  final String title;
  final String details;
  final String description;

  InternshipData(this.title, this.details, this.description);
}

class InternshipDetailsPage extends StatelessWidget {
  final InternshipData internshipData;

  InternshipDetailsPage(this.internshipData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  internshipData.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
                Text(internshipData.details),
                SizedBox(height: 16),
                Text(internshipData.description),
                Container(
                  margin: EdgeInsets.all(90),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Internship extends StatelessWidget {
  const Internship({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internship"),
      ),
      body: InternshipList(),
    );
  }
}

class InternshipList extends StatefulWidget {
  @override
  _InternshipListState createState() => _InternshipListState();
}

class _InternshipListState extends State<InternshipList> {
  List<DocumentSnapshot> _documentList = [];

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('internship');

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
            title: Text(data['title'] ?? 'No title available'),
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
        title: Text(data['title'] ?? 'No title available'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                'I ID: ${data['iid']}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Container(
                margin: EdgeInsets.all(90),
                child: Semantics(
                  label: 'Apply button',
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
                          margin:
                              EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
