import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({super.key});

  @override
  State<MyHeader> createState() => _MyHeaderDrawerState_a();
}

class _MyHeaderDrawerState_a extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 70,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              //see the changes in the network image
              //do a different way for profile image
              image: const DecorationImage(
                  image: AssetImage("assets/logo1.png"),
                  //NetworkImage("https://cdn5.vectorstock.com/i/1000x1000/72/74/female-avatar-profile-icon-round-woman-face-vector-18307274.jpg"),
                  fit: BoxFit.scaleDown
                  )
                ),
        ),
        const Text(
          "ALpha Tech",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text("infoalphatech75@gmail.com",
            style: TextStyle(color: Colors.grey[200], fontSize: 14)),
      ]),
    );
  }
}
