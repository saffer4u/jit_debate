import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:jit_debate/Decoration/input_decoration.dart';
import 'package:jit_debate/Decoration/login_decoration.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/widgets/custom_grad_title.dart';
import 'admin/admin_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _progress = false;
  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  String errMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: bgColor,
          ),
          inAsyncCall: _progress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomGradTitle(title: 'Admin', fntSize: 45),
                  CustomGradTitle(title: 'LogIN', fntSize: 35),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 320,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 5.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [grdntColor1, grdntColor2],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: loginInputDecoration(
                                    label: 'Email',
                                    hinttext: 'eg. erafifa@softkru.com',
                                  ),
                                  controller: _emailEditingController,
                                  validator: (email) {
                                    if (email!.isEmpty ||
                                        !email.contains('@')) {
                                      return 'Please Enter Admin Email or contact SoftKru';
                                    }
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: loginInputDecoration(
                                  label: 'Password',
                                  hinttext: '*********',
                                ),
                                controller: _passwordEditingController,
                                validator: (password) {
                                  if (password!.length < 6 ||
                                      password.isEmpty) {
                                    return 'Hmm... Check Your Password';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                errMsg,
                                style: TextStyle(
                                    fontSize: 16, fontStyle: FontStyle.italic),
                              ),
                              ElevatedButton(
                                child: Text('LogIn'),
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      _progress = true;
                                    });
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email:
                                                  _emailEditingController.text,
                                              password:
                                                  _passwordEditingController
                                                      .text);
                                      setState(() {
                                        _progress = false;
                                      });
                                      Navigator.of(context)
                                          .pushReplacementNamed('adminscreen');
                                    } catch (e) {
                                      setState(() {
                                        _progress = false;
                                        errMsg = "Invalid Credentials";
                                      });
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 6,
                                  minimumSize: Size(140, 40),
                                  primary: textColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              )
                            ],
                          )),
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






//  child: FlutterLogin(

//         title: 'Admin Log In',
//         onLogin: (){},
//         onSubmitAnimationCompleted: () {
          
//         },
//         onRecoverPassword: (){},
//       ),