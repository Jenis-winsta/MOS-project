import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/User/my_drawer_header.dart';
import 'package:finalapp/User/pages/Dashboard/dashboard.dart';
import 'package:finalapp/User/pages/faqs.dart';
import 'package:finalapp/User/pages/feedback.dart';
import 'package:finalapp/User/pages/notification.dart';
import 'package:finalapp/User/pages/policy.dart';
import 'package:finalapp/User/pages/profile_update.dart';
import 'package:finalapp/User/pages/settings.dart';

void main() {
  runApp(const as_User());
}

class as_User extends StatelessWidget {
  const as_User({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    final user= FirebaseAuth.instance.currentUser;
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.profile_update) {
      container = ProfilePage();
    } else if (currentPage == DrawerSections.FAQs) {
      container = FaqsPage();
    } else if (currentPage == DrawerSections.notification) {
      container = NotificationPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PolicyPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = FeedbackPage();
    } 
    // else if (currentPage == DrawerSections.logout) {
    //   container = LogoutPage();
    // }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
            },
             icon: Icon(Icons.leave_bags_at_home)
            )
        ],
        backgroundColor: Colors.purple[700],
        title: Text("Alpha tech"),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [const MyHeaderDrawer(), MyDrawerList()],
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
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "FAQs", Icons.format_quote_outlined,
              currentPage == DrawerSections.FAQs ? true : false),
          menuItem(3, "Profile update", Icons.contacts,
              currentPage == DrawerSections.profile_update ? true : false),
          Divider(),
          menuItem(4, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(5, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notification ? true : false),
          Divider(),
          menuItem(6, "Privacy_policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(7, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          // menuItem(8, "Log Out", Icons.logout,
          //     currentPage == DrawerSections.logout ? true : false)
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
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.FAQs;
            } else if (id == 3) {
              currentPage = DrawerSections.profile_update;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            } else if (id == 5) {
              currentPage = DrawerSections.notification;
            } else if (id == 6) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 7) {
              currentPage = DrawerSections.send_feedback;
            } 
            // else if (id == 8) {
            //   currentPage = DrawerSections.logout;
            // }
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

enum DrawerSections {
  dashboard,
  FAQs,
  profile_update,
  settings,
  notification,
  privacy_policy,
  send_feedback,
  // logout
}

//planning to have a organization section where user can prioratise their company profiles
//as well custamise your app setting in swipe
