import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';

import '../Decoration/custom_box_decoration.dart';
import '../Decoration/input_decoration.dart';

class RegistraionScreeen extends StatefulWidget {
  RegistraionScreeen({Key? key}) : super(key: key);

  @override
  State<RegistraionScreeen> createState() => _RegistraionScreeenState();
}

class _RegistraionScreeenState extends State<RegistraionScreeen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _phoneNoEditingController =
      TextEditingController();
  final TextEditingController _fullnameEditingController =
      TextEditingController();
  final TextEditingController _rollNoEditingController =
      TextEditingController();
  final TextEditingController _departmentEditingController =
      TextEditingController();
  final TextEditingController _remarkEditingController =
      TextEditingController();
  String dropdownCourse = 'B.Tech';
  int dropDownYear = 1;
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    var msg = "";
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'JIT-DEBATE',
                    style: TextStyle(
                        fontFamily: 'Cubano',
                        color: Colors.black87,
                        fontSize: 30),
                  ),
                ),
                Text(msg),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Please Type Your Name";
                      }

                      if (5 >= name.length) {
                        return ('Name must be more than 5 letters');
                      }
                    },
                    controller: _fullnameEditingController,
                    decoration: buildInputDecoration(
                        label: "Full Name", hinttext: "Student Name in JIT"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (phoneno) {
                      // int noLength = 10;
                      if (phoneno!.isEmpty) {
                        return "Please enter your Roll no.";
                      }
                      if (phoneno.length > 10) {
                        return ("Roll No. can't be less than 10");
                      }
                    },
                    controller: _rollNoEditingController,
                    decoration: buildInputDecoration(
                        label: "Roll No.", hinttext: "eg.1854510012"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter an Email";
                      }
                      if (!value.contains('@')) {
                        return ('invalid credential');
                      }
                    },
                    controller: _emailEditingController,
                    decoration: buildInputDecoration(
                        label: "Email", hinttext: "eg. xyz@gmail.com"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (phoneno) {
                      // int noLength = 10;
                      if (phoneno!.isEmpty) {
                        return "Please a Phone no.";
                      }
                      if (phoneno.length != 10) {
                        return ("Phone no. can't be less than 10");
                      }
                    },
                    controller: _phoneNoEditingController,
                    decoration: buildInputDecoration(
                        label: "Phone No.", hinttext: "eg. 9876543210"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _departmentEditingController,
                    decoration: buildInputDecoration(
                        label: "Department", hinttext: "eg. CSE, ME, CE, EE"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: customBoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, bottom: 2, top: 2, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Your Course '),
                          DropdownButton<String>(
                            value: dropdownCourse,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 25,
                            elevation: 8,
                            borderRadius: BorderRadius.circular(12),
                            style: const TextStyle(color: Colors.black54),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownCourse = newValue!;
                              });
                            },
                            items: <String>[
                              'B.Tech',
                              'Diploma',
                              'B.Pharma',
                              'D.Pharma',
                              'B.A.',
                              'B.Com',
                              'Others',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: customBoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, bottom: 2, top: 2, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Your Current Year'),
                          DropdownButton<int>(
                            value: dropDownYear,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 8,
                            style: const TextStyle(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                            iconEnabledColor: HexColor('#3e1610'),
                            onChanged: (int? newValue) {
                              setState(() {
                                dropDownYear = newValue!;
                              });
                            },
                            items: <int>[
                              1,
                              2,
                              3,
                              4,
                            ].map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _remarkEditingController,
                    decoration: buildInputDecoration(
                        label: "Remark (Optional)",
                        hinttext: "Tell Us Your Preference"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      primary: HexColor('153d35'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        final Map<String, dynamic> mapped = {
                          'name': _fullnameEditingController.text,
                          'rollno': _rollNoEditingController.text,
                          'email': _emailEditingController.text,
                          'phoneno': _phoneNoEditingController.text,
                          'department': _departmentEditingController.text,
                          'remark': _remarkEditingController.text,
                          'course': dropdownCourse,
                          'year': dropDownYear,
                        };
                        await FirebaseFirestore.instance
                            .collection('user')
                            .add(mapped);

                        //? we have to give map to .add fuction of firebase
                        // await FirebaseFirestore.instance
                        //     .collection('user')
                        //     .add({
                        //   'name': _fullnameEditingController.text,
                        //   'rollno': _rollNoEditingController.text,
                        //   'email': _emailEditingController.text,
                        //   'phoneno': _phoneNoEditingController.text,
                        //   'department': _departmentEditingController.text,
                        //   'remark': _remarkEditingController.text,
                        //   'course': dropdownCourse,
                        //   'year': dropDownYear,
                        // });
                      }
                      //? try to do something if it fails return in catch block
                      // try {
                      //   final uid =
                      //       await _auth.createUserWithEmailAndPassword(
                      //     email: _emailEditingController.text,
                      //     password: _paswordEditingController.text,
                      //   );
                      // } catch (error) {
                      //   setState(() {
                      //     msg = error.toString();
                      //   });
                      // }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign Up",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
