import 'package:flutter/material.dart';

// class PolicyPage extends StatelessWidget {
//   //const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child: Text("PriSILFJSODJFvate policy page"),
//       ),
//     );
//   }
// }



class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  static const String _title = 'Privacy Policy for Alpha-Tech Hiring App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title),
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        //       onPressed: () => Navigator.of(context).pop(),
        //     );
        //   }),
        // ),
        body: ListView(
        children: <Widget>[
          const SizedBox(height: 15),
          Text("   Privacy Policy for Alpha-Tech Hiring App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          const SizedBox(height: 15),
          ListTile(
            title: const Text("Last Updated: February 5, 2023"),
            onTap: () {
              // perform action when item is tapped
            },
          ), const SizedBox(height: 10),
          ListTile(
            title: const Text("Introduction"),
            subtitle: const Text('\nOur App collects information from job seekers, employers, and visitors to our app in several ways, including:\n'
                                 '1. Account Information: When you create an account with Hiring App, we collect information such as your name, email address, password, and profile information.\n'
                                 '2. Job Applications: If you are a job seeker, we collect information you provide in your job applications, including your resume, work history, education, and other details about your qualifications.\n'
                                 '3. Job Postings: If you are an employer, we collect information about the job postings you create, including the job title, location, salary, and other details about the job.\n'
                                 '4. Communication Information: We collect information about the communications you have with us, such as customer service inquiries, feedback, and technical support requests.\n'
                                 '5. Technical Information: We collect information about the devices you use to access our app, including IP addresses, device types, operating systems, and browser types'),
            onTap: () {
              // perform action when item is tapped
            },
          ),const SizedBox(height: 10),
          ListTile(
            title: const Text("How We Use Your Information"),
            subtitle: const Text("\nOur App uses your information to provide, maintain, and improve our app. We also use your information to communicate with you about your use of our app, to respond to your inquiries, and to provide customer support."),
            onTap: () {
              // perform action when item is tapped
            },
          ),const SizedBox(height: 10),
          ListTile(
            title: const Text("Sharing of Your Information"),
            subtitle: const Text("\nOur App may share your information with third-party service providers for the purpose of operating and improving our app. These third-party service providers are subject to strict confidentiality agreements and are not permitted to use your information for any other purpose.\n\n"
            "Our App may also share your information in response to legal process, such as a court order or subpoena, or in response to a government request."),
            onTap: () {
              // perform action when item is tapped
            },
          ),const SizedBox(height: 10),
          ListTile(
            title: const Text("Your Rights and Choices"),
            subtitle: const Text("\nYou have the right to access and control your personal information. You can request a copy of your information or request that we delete your information by contacting us at infoalphatech75@gmail.com .\n\n"
            "You can also control the information you provide to our App by adjusting your account settings and profile information."),
            onTap: () {
              // perform action when item is tapped
            },
          ),const SizedBox(height: 10),
          ListTile(
            title: const Text("Changes to This Privacy Policy"),
            subtitle: const Text("\nWe may update this Privacy Policy from time to time to reflect changes in our privacy practices. We will notify you of any changes by posting the updated Privacy Policy on our app."),
            onTap: () {
              // perform action when item is tapped
            },
          ),const SizedBox(height: 10),
          ListTile(
            title: const Text("Contact Us"),
            subtitle: const Text("\nIf you have any questions or concerns about this Privacy Policy or our privacy practices, please contact us at infoalphatech75@gmail.com ."),
            onTap: () {
              // perform action when item is tapped
            },
          ),const SizedBox(height: 10),
        ],
      ),
      ),
    );
  }
}