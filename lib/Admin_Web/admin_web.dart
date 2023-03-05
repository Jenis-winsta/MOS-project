import 'package:finalapp/Admin_Web/home_screen.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class Admin_Web extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashScreen.id,
      // routes: {
      //   // SplashScreen.id:(context)=>SplashScreen(),
      //   // LoginScreen.id: (context)=>LoginScreen(),
      //   HomeScreen.id:(context)=>HomeScreen(),
      //   ReportAnalysisScreen.id:(context)=>ReportAnalysisScreen(),
      //   SupportAssistenceScreen.id:(context)=>SupportAssistenceScreen(),
      // },
      home: Scaffold(
        // appBar: AppBar(title: Text("Admin dashboard")),
        body:HomeScreen(),
      ),
    );
  }
}

