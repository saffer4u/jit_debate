import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/screens/admin/approval.dart';
import 'package:jit_debate/widgets/image_button_custom.dart';

class TotalParticipants extends StatefulWidget {
  @override
  _TotalParticipantsState createState() => _TotalParticipantsState();
}

class _TotalParticipantsState extends State<TotalParticipants> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('approvedUser').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return LoadingText(txt: 'Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingText(txt: 'Loading...');
        }

        return ListView(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
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
                                          fntSize: 18,
                                          clr: Colors.white,
                                          fntFmly: 'Cubano',
                                          fntWt: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              ImageButtonCustom(
                                size: 30,
                                imagePath: "icons/trash.png",
                                onDaba: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        backgroundColor: bgColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        title: Text(
                                            "Sure to Delete ${data['name']}?"),
                                        content: Text(
                                            "Deleting Request will erase all Data of this User"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();

                                              await FirebaseFirestore.instance
                                                  .collection('approvedUser')
                                                  .doc(docId)
                                                  .delete();
                                            },
                                            child: Text("Erase"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black12.withOpacity(0.5),
                                    Colors.black38.withOpacity(0.5),
                                    Colors.black87.withOpacity(0.5)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone : ${data['phoneno']}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                                Text(
                                  "Email : ${data['email']}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                                Text(
                                  "Course : ${data['course']}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                                Text(
                                  "Department : ${data['department']}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                                Text(
                                  "Roll No : ${data['rollno']}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                                Text(
                                  "Year : ${data['year'].toString()}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                                Text(
                                  "Remark : ${data['remark'].toString()}",
                                  style: cardTextStyle(
                                      fntSize: 12, clr: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
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
