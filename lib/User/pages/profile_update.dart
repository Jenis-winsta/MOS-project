import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   //const DashboardPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child:Text("Profile update page"),
//         ),
//     );
//   }
// }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Update',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: EditProfileUI(),
    );
  }
}

class EditProfileUI extends StatefulWidget {
  const EditProfileUI({super.key});

  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  bool isObscurePassword = true;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  void _updateUser() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("user").doc(user!.email);
    if (_nameController.text.trim() != '') {
      String name = _nameController.text.trim();
      Map<String, dynamic> userinfo = {
        "Name": name,
      };
      documentReference.update(userinfo).whenComplete(() {
        if (kDebugMode) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Name Updated successfully"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              backgroundColor: Colors.green,
            ),
          );
          print("$name updated");
        } else {
          if (kDebugMode) {
            print("error");
          }
        }
      });
    }
    if (_mobileController.text.trim() != '') {
      String mobile = _mobileController.text.trim();
      Map<String, dynamic> userinfo = {
        "mobile": mobile,
      };
      documentReference.update(userinfo).whenComplete(() {
        if (kDebugMode) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Mobile no. Updated successfully"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              backgroundColor: Colors.green,
            ),
          );
          print("Mobile no. updated");
        } else {
          if (kDebugMode) {
            print("error");
          }
        }
      });
    }

    if (_bioController.text.trim() != '') {
      String bio = _bioController.text.trim();
      Map<String, dynamic> userinfo = {
        "Bio": bio,
      };
      documentReference.update(userinfo).whenComplete(() {
        if (kDebugMode) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("BIO Updated successfully"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              backgroundColor: Colors.green,
            ),
          );
          print("Bio Updated");
        } else {
          if (kDebugMode) {
            print("error");
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var arrow_back;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              // image: AssetImage('assets/male.jpg'),
                              image:AssetImage('assets/girl.png'),
                            ))),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text('Name'),
              Semantics(
                label: 'Name',
                child: TextFormField(
                  controller: _nameController,
                  // decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              SizedBox(height: 30),
              Text('Mobile no.'),
              Semantics(
                label: 'Mobile number',
                child: TextFormField(
                  controller: _mobileController,
                  // decoration: InputDecoration(labelText: 'Mobile no.'),
                ),
              ),
              SizedBox(height: 30),
              Text('Bio'),
              Semantics(
                label: 'Bio details',
                child: TextFormField(
                  controller: _bioController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  // decoration: InputDecoration(labelText: 'Bio'),
                ),
              ),

              // buildTextField("Name", "User", false),
              // buildTextField("Mobile no.", "00000 00000", false),
              // buildTextField("Password", "******", true),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    label: 'Cancel',
                    child: OutlinedButton(
                      onPressed: () {
                        _nameController.text = '';
                        _mobileController.text = '';
                        _bioController.text = '';
                      },
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Semantics(
                    label: 'Save',
                    child: ElevatedButton(
                      onPressed: () {
                        _updateUser();
                      },
                      child: Text("SAVE",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                          )),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade700,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
