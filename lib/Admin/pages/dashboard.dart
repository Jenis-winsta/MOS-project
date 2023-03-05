import 'package:flutter/material.dart';

// import 'package:flutter_admin_scaffold/admin_scaffold.dart';
class DashboardPage_a extends StatelessWidget {
  //const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
          child: Text("jnis"),
          onPressed: () {},
        )),
      ),
    );
  }
}
