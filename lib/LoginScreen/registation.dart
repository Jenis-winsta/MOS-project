import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/LoginScreen/authpage.dart';
import 'package:finalapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class Registration extends StatelessWidget {
  //  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const RegistrationPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _obscureText = true;
  bool verify = false;

  // final message = SnackBar(content: Text("JEnsi"));

  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  // final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  void _submitForm() {
    // if (_formKey.currentState.validate()) {

    if (kDebugMode) {
      String name = _nameController.text.trim();
      String id = _idController.text.trim();
      String mobile = _mobileController.text.trim();
      String email = _emailController.text.trim();
      // String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();
      String bio = _bioController.text.trim();
      print('Name: $name');
      print('ID: $id');
      print('Mobile: $mobile');
      print('Email: $email');
      // print('Username: $username');
      print('Password: $password');
      print('BIO: $bio');
    }

    // }
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error occured"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          backgroundColor: Colors.green,
        ),
      );
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void _createUser() {
    String name = _nameController.text.trim();
    String id = _idController.text.trim();
    String mobile = _mobileController.text.trim();
    String email = _emailController.text.trim();
    // String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String bio = _bioController.text.trim();

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("user").doc(email);

    //Map
    Map<String, dynamic> userinfo = {
      "Name": name,
      "id": id,
      "mobile": mobile,
      "email": email,
      "password": password,
      "Bio": bio,
    };
    documentReference.set(userinfo).whenComplete(() {
      if (kDebugMode) {
        print("create user");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Regisered successfully"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            backgroundColor: Colors.green,
          ),
        );
        print("$name created");
      } else {
        if (kDebugMode) {
          print("error");
        }
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //       content: Text("Could not create User"),
        //       behavior: SnackBarBehavior.floating,
        //       margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0)),
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AuthPage()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const
                  SizedBox(
                    height: 40,
                  ),
                  Text('Name'),
                  Semantics(
                    label: 'Name',
                    child: TextFormField(
                      controller: _nameController,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('ID'),
                  Semantics(
                    label: 'Id',
                    child: TextFormField(
                      controller: _idController,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('Mobile'),
                  Semantics(
                    label: 'Mobile no.',
                    child: TextFormField(
                      controller: _mobileController,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('Email'),
                  Semantics(
                    label: 'Email',
                    child: TextFormField(
                      controller: _emailController,
                    ),
                  ),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) =>
                  //     value != null
                  //         ? 'Enter a valid email'
                  //         : null,

                  // SizedBox(height: 16.0),
                  // Text('Username'),
                  // TextFormField(
                  //   controller: _usernameController,
                  // ),
                  SizedBox(height: 16.0),
                  Text('Password'),
                  Semantics(
                    label: 'Password',
                    child: TextFormField(
                        controller: _passwordController,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min 6 characters'
                            : null,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            // labelText: 'Password',
                            suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ))),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _bioController,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      alignLabelWithHint: true,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                  ),
                  SizedBox(height: 32.0),
                  Center(
                    child: Column(
                      children: [
                        Semantics(
                          label: 'Register button',
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20)),
                            onPressed: () {
                              _submitForm();
                              _createUser();
                              signUp();

                              print("pressed : register");
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 20),
                                // text: "Already have an account?  ",
                                children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = widget.onClickedSignIn,
                                  text: 'Log in',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]))
                        // TextButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => Login()));
                        //     },
                        //     child: Text(
                        //       "Sign in",
                        //       style: TextStyle(fontSize: 20),
                        //     )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
