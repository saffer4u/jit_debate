import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  User? user;

  Future<User?> _authState() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      user = event;
    });
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _authState(),
        builder: (ctx, snapshot) {
          if (snapshot == null) {
            Navigator.of(context).pushReplacementNamed('loginscreen');
          } else {
            Navigator.of(context).pushReplacementNamed('adminscreen');
          }
          return Center(
            child: Text("Loading..."),
          );
        },
      ),
    );
  }
}
