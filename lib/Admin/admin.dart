import 'package:finalapp/Admin/my_drawer_header.dart';
import 'package:finalapp/Admin/pages/dashboard.dart';
import 'package:finalapp/Admin/pages/interview.dart';
import 'package:finalapp/Admin/pages/logout.dart';
import 'package:finalapp/Admin/pages/massEmail.dart';
import 'package:finalapp/Admin/pages/reportsAnalysis.dart';
import 'package:finalapp/Admin/pages/sendNotification.dart';
import 'package:finalapp/Admin/pages/settings.dart';
import 'package:finalapp/Admin/pages/supportAssistence.dart';
import 'package:flutter/material.dart';






void main() {
  runApp(const Admin());
}

class Admin extends StatelessWidget {
  const Admin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage_a(),
    );
  }
}

class HomePage_a extends StatefulWidget {
  const HomePage_a({super.key});

  @override
  State<HomePage_a> createState() => _HomePageState_a();
}

class _HomePageState_a extends State<HomePage_a> {
  var currentPage = DrawerSections_a.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections_a.dashboard) {
      container = DashboardPage_a();
    } else if (currentPage == DrawerSections_a.interview) {
      container = InterviewPage_a();
    } else if (currentPage == DrawerSections_a.sendNotification) {
      container = SendNotificationPage_a();
    } else if (currentPage == DrawerSections_a.massEmail) {
      container = MassEmailPage_a();
    } else if (currentPage == DrawerSections_a.reportsAnalysis) {
      container = ReportsAnalysisPage_a();
    } else if (currentPage == DrawerSections_a.settings) {
      container = SettingsPage_a();
    } else if (currentPage == DrawerSections_a.supportAssistence) {
      container = SupportAssistencePage_a();
    } else if (currentPage == DrawerSections_a.logout){
      container = LogoutPage_a();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Alpha tech Admin Panel"),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [const MyHeaderDrawer_a(), MyDrawerList()],
          ),
        ),
      ),
    );
  }

//create a new dart file for drawer elements which returns the below and has a widget seperately inside it with menuItems
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        //shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == DrawerSections_a.dashboard ? true : false),
          menuItem(2, "Interview", Icons.integration_instructions,
              currentPage == DrawerSections_a.interview ? true : false),
          menuItem(3, "Send Notification", Icons.notifications,
              currentPage == DrawerSections_a.sendNotification ? true : false),
          Divider(),
          menuItem(4, "Mass Email", Icons.email,
              currentPage == DrawerSections_a.massEmail ? true : false),
          menuItem(5, "Reports & Analysis", Icons.analytics,
              currentPage == DrawerSections_a.reportsAnalysis ? true : false),
          Divider(),
          menuItem(6, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections_a.settings ? true : false),
          menuItem(7, "Support & assistence", Icons.contact_support,
              currentPage == DrawerSections_a.supportAssistence ? true : false),
          menuItem(8, "Logout", Icons.logout,
              currentPage == DrawerSections_a.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections_a.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections_a.interview;
            } else if (id == 3) {
              currentPage = DrawerSections_a.sendNotification;
            } else if (id == 4) {
              currentPage = DrawerSections_a.massEmail;
            } else if (id == 5) {
              currentPage = DrawerSections_a.reportsAnalysis;
            } else if (id == 6) {
              currentPage = DrawerSections_a.settings;
            } else if (id == 7) {
              currentPage = DrawerSections_a.supportAssistence;
            } else if (id == 8){
              currentPage = DrawerSections_a.logout;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
                child: Icon(
              icon,
              size: 20,
              color: Colors.black,
            )),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            )
          ]),
        ),
      ),
    );
  }
}


enum DrawerSections_a {
  dashboard,
  interview,
  sendNotification,
  massEmail,
  reportsAnalysis,
  settings,
  supportAssistence,
  logout

}

//planning to have a organization section where user can prioratise their company profiles
//as well custamise your app setting in swipe
