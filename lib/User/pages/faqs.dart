import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  static const String _title = 'FAQs';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title),
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),onPressed: () => Navigator.of(context).pop(true),
        //     );
        //   }       
        //    ),
        // backgroundColor: Colors.blue,
        // elevation: 0.0,
        // ),
        body: ListView(
        children: const <Widget>[
          SizedBox(height: 15),
          // const SizedBox(width: 15),
          Text("    FAQs ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
          SizedBox(height: 15),
          ListTile(
            title: Text("1. What is the purpose of the our app?"),
            subtitle: Text("Our app is designed to streamline the recruitment process by providing a platform for companies to find and hire talented developers for their mobile app projects."),
            
          ), SizedBox(height: 10),
          ListTile(
            title: Text("2. Who can use our app?"),
            subtitle: Text("Our app is designed for both companies and developers. Companies can use the app to find and hire mobile app developers, while developers can use the app to find and apply for relevant job opportunities."),
            
          ),SizedBox(height: 10),
          ListTile(
            title: Text("3. How does the hiring process work?"),
            
          ),SizedBox(height: 10),
          ListTile(
            title: Text("4. What information is required to sign up for our app?"),
            subtitle: Text("To sign up for our app, companies and developers need to provide their email address, password, and basic personal information. Companies also need to provide information about their business, including the company name, website, and location."),
            
          ),SizedBox(height: 10),
          ListTile(
            title: Text("5. How is the matching process between companies and developers done?"),
            subtitle: Text("The matching process between companies and developers is done by using an algorithm that matches the skills, experience, and job requirements of the developers with the job listings posted by the companies."),
           
          ),SizedBox(height: 10),
          ListTile(
            title: Text("6. Is the our app free to use?"),
            subtitle: Text("There may be a fee for companies to post job listings and access certain features on the hiring app. Developers can use the app for free to find job opportunities and apply for positions."),
            
          ),SizedBox(height: 10),
          ListTile(
            title: Text("7. How does our app protect the privacy of its users?"),
            subtitle: Text("Our app takes user privacy seriously and implements strict security measures to protect the personal information of its users. This information is stored securely and is not shared with any third parties. The hiring app also has a detailed privacy policy that outlines how user data is collected, used, and protected."),
          ),SizedBox(height: 10),
        ],
      ),
      ),
    );
  }
}