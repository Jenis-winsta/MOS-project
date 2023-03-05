import 'package:finalapp/LoginScreen/loginScreen.dart';
import 'package:finalapp/LoginScreen/registation.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  // const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{  
  bool isLogin=true;
  @override
  Widget build(BuildContext context)
  => isLogin
      ? LoginScreen(onClickedSignUp:toggle)
      :RegistrationPage(onClickedSignIn:toggle);

  void toggle()=>setState(()=>isLogin=!isLogin);
}