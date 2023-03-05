import 'package:finalapp/User/pages/Dashboard/appstatus.dart';
import 'package:finalapp/User/pages/Dashboard/internship.dart';
import 'package:finalapp/User/pages/Dashboard/jobsearch.dart';
import 'package:finalapp/User/pages/Dashboard/jobsearchtest.dart';
import 'package:finalapp/User/pages/Dashboard/vacancy.dart';
import 'package:flutter/material.dart';


// import 'detail.dart';

// void main() {
//   runApp(const MyApp());
// }

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha tech',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade700),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var win = "title";
  var title, subtitle, image;
  int code = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrange,
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: ListView(
        children: <Widget>[
          _top(),
          SizedBox(
            height: 0.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
                // Text("View All",
                //     style:
                //         TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
              ],
            ),
          ),
          Container(
            height: 210.0,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3 / 2),
              children: [
                _gridItem(Icons.manage_search, "Job Search",1),
                _gridItem(Icons.people_alt, "Vacancy",2),
                _gridItem(Icons.business, "Internship",3),
                _gridItem(Icons.query_stats, "Application status",4),
                // _gridItem(Icons.add_location,"location"),
                // _gridItem(Icons.arrow_drop_down_circle,"arrow"),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Latest",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("View All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0))),
              ],
            ),
          ),
          _listview(1,"Web developer", "4 yr exp", "assets/coder.jpeg"),
          _listview(2,"Manager", "3 yr", "assets/web.jpeg"),
          _listview(3,"Designer", "Internship", "assets/it.jpg"),
          
        ],
      ),
    );
  }

  _listview(code,title, subtitle, image) {
    return Padding(
      
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          // widget:10,
          title: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              )),
          subtitle: Text(subtitle,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          leading: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0)),
          ),
          trailing: Icon(Icons.star),
          onTap: () {
            if(code==1){
              //for web developer
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vacancy()));
            }else if(code == 2){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vacancy()));
            }
            else if(code==3){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vacancy()));
            }
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Vacancy()));
          },
        ));
  }

  

  _gridItem(icon, cat_text,num) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: cat_text,
          backgroundColor: Colors.purple.shade700,
          foregroundColor: Colors.white,
          splashColor: Colors.purple.shade200,
          child: Icon(
            icon,
            size: 30,
          ),
          onPressed: () {
            if(num==1){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => JobSearch()));
            }else if(num==2){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vacancy()));
            }else if (num==3){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => Internship()));
            }else if(num==4){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppStatus()));
            }
          },
        ),
        // CircleAvatar(
        //   radius: 30,
        //   child: Icon(
        //     icon,
        //     size: 30,
        //     color: Colors.white,
        //   ),
        //   backgroundColor: Colors.purple.shade700.withOpacity(0.9),
        // ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          cat_text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        )
      ],
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.purple.shade700,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       children: [
          //         CircleAvatar(
          //           backgroundImage: AssetImage("assets/profile.jpeg"),
          //         ),
          //         SizedBox(
          //           width: 10.0,
          //         ),
          //         Text(
          //           "Hi, Hawkins",
          //           style: TextStyle(color: Colors.white),
          //         )
          //       ],
          //     ),
          //     IconButton(
          //         onPressed: () {
          //           print("notifications");
          //         },
          //         icon: Icon(
          //           Icons.notifications,
          //           color: Colors.white,
          //         ))
          //   ],
          // ),
          // SizedBox(
          //   height: 30.0,
          // ),
          TextField(
            decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Icon(Icons.filter_list),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)),
          )
        ],
      ),
    );
  }
}
