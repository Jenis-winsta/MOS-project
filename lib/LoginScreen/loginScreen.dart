import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:finalapp/Admin/admin.dart';
import 'package:finalapp/Admin_Web/admin_web.dart';
import 'package:finalapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class LoginScreen extends StatefulWidget {
  // const LoginScreen({super.key});
  // final Function() onClickedSignin;

  // const LoginScreen({
  //   Key? key, required this.onClickedSignup,
  // }):super(key: key);
  
  final VoidCallback onClickedSignUp;

  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,
  }):super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey= GlobalKey<FormState>();
 
  String email_='';
  String password_='';
  int error=0;
 

  login_fun(String email,String password){
    
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("user").doc(email);

    // DocumentReference documentReference =
    //     FirebaseFirestore.instance.collection("Pets").doc(petName);
    documentReference.get().then((datasnapshot) {
      if (kDebugMode) {
        print(datasnapshot.data());

      }
      else{
        print("error");
      }
    });

  }
  Future <String> getName(String email) async{
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String name="";

    await firestore
      .collection('user')
      .doc(email)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
      name = documentSnapshot.get('Name');
      print('Name: $name');
    } else {
      print('Document does not exist!');
    }
      }).catchError((error){
        print('Error getting document: $error');
      });
    return name;
  }

  Future signIn() async{
    showDialog(context: context,
    barrierDismissible: false,
     builder: (context)=>Center(child: CircularProgressIndicator())
     );
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTEC.text.trim(), password: passwordTEC.text.trim());
    }
    on FirebaseAuthException catch (e){
      // error=1;
      if (kDebugMode) {
        print(e);
      }
    }
    // if(error==1){
    //   const MaterialBanner(
    //     padding: EdgeInsets.all(20),
    //     content: Text('Hello, I am a Material Banner'),
    //     leading: Icon(Icons.agriculture_outlined),
    //     backgroundColor: Color(0xFFE0E0E0),
    //     actions: <Widget>[
    //       TextButton(
    //         onPressed: null,
    //         child: Text('OPEN'),
    //       ),
    //       TextButton(
    //         onPressed: null,
    //         child: Text('DISMISS'),
    //       ),
    //     ],
    //   );
    // }
    //Navigator.of(content) not worl
    navigatorKey.currentState!.popUntil((route)=>route.isFirst);

  }


  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  // bool isRememberMe = false;
  bool _obscureText = true;

  @override
  void dispose(){
    emailTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }

  // static login(){
  //   DocumentReference documentReference =
  //       FirebaseFirestore.instance.collection("Pets").doc(petName);
  //   documentReference.get().then((datasnapshot) {
  //     if (kDebugMode) {
  //       print(datasnapshot.data());
  //     }
  //   }
  //   );
  // }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            // key: ValueKey('email'),
            controller: emailTEC,
            // keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person, color: Color(0xffC468F9)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
            
            // onSaved: (value){
            //   setState(() {
            //     email_=value!;
            //   });
            // },
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            
            
            // onSaved:(value){
            //   setState(() {
            //     password_=value!;
            //   });
            // },
            
            controller: passwordTEC,
            obscureText: _obscureText,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(Icons.lock, color: Color(0xffC468F9)),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.black38),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        // padding: EdgeInsets.only(right: 0),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget buildRememberCb() {
  //   return Container(
  //     height: 20,
  //     child: Row(
  //       children: <Widget>[
  //         Theme(
  //           data: ThemeData(unselectedWidgetColor: Colors.white),
  //           child: Checkbox(
  //             value: isRememberMe,
  //             checkColor: Colors.purple,
  //             activeColor: Colors.white,
  //             onChanged: (value) {
  //               setState(() {
  //                 isRememberMe = value!;
  //               });
  //             },
  //           ),
  //         ),
  //         const Text(
  //           'Remember Me',
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Semantics(
        label: 'Login',
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: const Color.fromARGB(255, 127, 7, 148),
            padding: const EdgeInsets.all(25),
            shadowColor: Colors.white,
          ),
          onPressed: () async{
            if (emailTEC.text == 'adminm' && passwordTEC.text == 'adminm') {
              print("admin");
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Admin()));
            } else if (emailTEC.text == 'admin' && passwordTEC.text == 'admin') {
              print("admin");
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Admin_Web()));
            } 
            else{
              signIn();
            }
            
            var _email = emailTEC.text;
            var _pass = passwordTEC.text;
            
      
            // if(_formKey.currentState!.validate()){
            //   _formKey.currentState!.save();
            //   login ? AuthServices.login_fun(email_,password_,context):AuthServices.signupUser(email_,password_,context);
            // }
            
            login_fun(_email,_pass);
            getName(_email);
            // LoginFirebase(_email,_pass);
            // if (_email == 'jenis' && _pass == 'jenis') {
            //   print("user");
            //   Navigator.pushReplacement(
            //       context, MaterialPageRoute(builder: (context) => const as_User()));
            // } else if (_email == 'adminm' && _pass == 'adminm') {
            //   print("admin");
            //   Navigator.pushReplacement(
            //       context, MaterialPageRoute(builder: (context) => const Admin()));
            // } else if (_email == 'admin' && _pass == 'admin') {
            //   print("admin");
            //   Navigator.pushReplacement(
            //       context, MaterialPageRoute(builder: (context) => Admin_Web()));
            // } else {
            //   print("error");
            // }
            print('Login Pressed');
            //User();
      
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => User()));
          },
          child: const Text(
            'LOGIN',
            style: TextStyle(
              // color: Colors.purple,
              color: Color.fromARGB(255, 251, 251, 251),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      //color: Colors.white,
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      // onTap: (() => print("Sign Up Pressed")),
      // onTap: (){
      //   print("sign up");
      //   Navigator.push(
      //           context, MaterialPageRoute(builder: (context) => Registration()));
      //   // Registration();

      // },

      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap=widget.onClickedSignUp,
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(102, 150, 51, 207),
                      Color.fromARGB(153, 160, 52, 222),
                      Color.fromARGB(204, 177, 54, 248),
                      Color.fromARGB(255, 190, 90, 248),
                    ],
                  )),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                        buildEmail(),
                        const SizedBox(height: 20),
                        buildPassword(),
                        buildForgotPassBtn(),
                        const SizedBox(height: 20),
                        // buildRememberCb(),
                        buildLoginBtn(),
                        buildSignUpBtn(),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
