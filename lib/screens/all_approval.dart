import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/screens/admin/approval.dart';
import 'package:jit_debate/widgets/image_button_custom.dart';

class AllApproval extends StatefulWidget {
  @override
  _AllApprovalState createState() => _AllApprovalState();
}

class _AllApprovalState extends State<AllApproval> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('approvedUser').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: LoadingText(
            txt: 'Something went wrong',
          ));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: LoadingText(txt: 'Loading...'));
        }

        return Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  final docId = document.id;
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Card(
                    elevation: 10,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [grdntColor1, grdntColor2],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        HexColor('#240b36').withOpacity(0.5),
                                        HexColor('#240b36').withOpacity(0.5),
                                      ]
                                          // colors: [Colors.black12, Colors.black45],
                                          ),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Text(
                                      "${data['name']}",
                                      style: cardTextStyle(
                                          fntSize: 20,
                                          clr: HexColor('ffffcc'),
                                          fntFmly: 'Cubano',
                                          fntWt: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black12.withOpacity(0.5),
                                              Colors.black38.withOpacity(0.5),
                                              Colors.black87.withOpacity(0.5)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "${data['email']}",
                                        style: cardTextStyle(
                                            fntSize: 10, clr: Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(height: 6),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black12.withOpacity(0.5),
                                              Colors.black38.withOpacity(0.5),
                                              Colors.black87.withOpacity(0.5)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "${data['course']}".toUpperCase(),
                                        style: cardTextStyle(
                                            fntSize: 9, clr: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black12.withOpacity(0.5),
                                              Colors.black38.withOpacity(0.5),
                                              Colors.black87.withOpacity(0.5)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Year - ${data['year']}".toUpperCase(),
                                        style: cardTextStyle(
                                            fntSize: 9, clr: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),

                                ////////////////
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  TextStyle cardTextStyle({
    required double fntSize,
    required Color clr,
    String? fntFmly,
    FontWeight? fntWt = FontWeight.bold,
  }) {
    return TextStyle(
        color: clr, fontSize: fntSize, fontFamily: fntFmly, fontWeight: fntWt);
  }
}
