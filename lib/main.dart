import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jit_debate/screens/home_screen.dart';

import 'screens/registration_screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        'regscreen': (context) => RegistraionScreeen(),
      },
    );
  }
}
