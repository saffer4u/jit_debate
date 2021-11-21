import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/screens/admin/admin_screen.dart';
import 'package:jit_debate/screens/admin/wrapper.dart';
import 'package:jit_debate/screens/all_approval.dart';
import 'package:jit_debate/screens/home_screen.dart';
import 'package:jit_debate/screens/login_screen.dart';
import 'package:jit_debate/services/auth_service.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          'regscreen': (context) => RegistraionScreeen(),
          'loginscreen': (context) => LogInScreen(),
          'adminscreen': (context) => AdminScreen(),
          'allapproval': (context) => AllApproval(),
          'wrapper': (context) => Wrapper(),
        },
      ),
    );
  }
}
