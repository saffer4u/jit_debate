import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/screens/admin/admin_screen.dart';
import 'package:jit_debate/screens/login_screen.dart';
import 'package:jit_debate/services/auth_service.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authState.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? LogInScreen() : AdminScreen();
        } else {
          return Scaffold(
              backgroundColor: bgColor,
              body: Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
