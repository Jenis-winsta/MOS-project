import 'package:finalapp/Admin_Web/my_drawer_header.dart';
import 'package:finalapp/Admin_Web/pages/Dashboard_screen.dart';
import 'package:finalapp/Admin_Web/pages/interview.dart';
import 'package:finalapp/Admin_Web/pages/logout.dart';
import 'package:finalapp/Admin_Web/pages/massEmail.dart';
import 'package:finalapp/Admin_Web/pages/reportsAnalysis.dart';
import 'package:finalapp/Admin_Web/pages/sendNotification.dart';
import 'package:finalapp/LoginScreen/authpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomeScreen extends StatefulWidget {
  static const String id="home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _selectedScreen= DashboardScreen();

  currentScreen(item){
    switch(item.route){
      case DashboardScreen.id: 
        setState(() {
          _selectedScreen= DashboardScreen();
        });
        break;

      case InterviewPage.id: 
        setState(() {
          _selectedScreen= InterviewPage();
        });
        break;

      case SendNotificationPage.id: 
        setState(() {
          _selectedScreen= SendNotificationPage();
        });
        break;

      case MassEmailPage.id: 
        setState(() {
          _selectedScreen= MassEmailPage();
        });
        break;
      
      case ReportsAnalysisPage.id: 
        setState(() {
          _selectedScreen= ReportsAnalysisPage();
        });
        break;

      case LogoutPage.id: 
        setState(() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AuthPage()));
          // _selectedScreen= LogoutPage();
        });
        break;

      
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple[700]),
        //useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AdminScaffold(
        
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text('Admin panel')),
        ),
        sideBar: SideBar(
          textStyle: TextStyle(color: Colors.black),
          activeBackgroundColor: Colors.grey.shade600,
          items: const [
            AdminMenuItem(
              // color:Colors.purple[700],
              title: 'Dashboard',
              route: DashboardScreen.id,
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: 'Interview',
              route: InterviewPage.id,
              icon: Icons.integration_instructions,
            ),
            AdminMenuItem(
              title: 'Send Notification',
              route: SendNotificationPage.id,
              icon: Icons.notifications,
            ),
            AdminMenuItem(
              title: 'Mass email',
              route: MassEmailPage.id,
              icon: Icons.email,
            ),
            AdminMenuItem(
              title: 'Reports & analysis',
              route: ReportsAnalysisPage.id,
              icon: Icons.analytics,
            ),
            AdminMenuItem(
              title: 'Logout',
              route: LogoutPage.id,
              icon: Icons.logout,
            ),
            
            
          ],
          selectedRoute: HomeScreen.id,
          onSelected: (item) {
            currentScreen(item);
            // if (item.route != null) {
            //   Navigator.of(context).pushNamed(item.route!);
            // }
          },
          header: MyHeader(),
          // footer: 
        ),
        body: SingleChildScrollView(
          child: _selectedScreen
        ),
      ),
    );
  }
}