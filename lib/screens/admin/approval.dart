import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/widgets/custom_grad_title.dart';
import 'package:jit_debate/widgets/image_button_custom.dart';

class Approval extends StatefulWidget {
  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return LoadingText(
            txt: 'Something went Wrong',
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingText(txt: 'Loading...');
        }
        if (snapshot.data!.docs.isEmpty) {
          return LoadingText(txt: "\"No Pending Participants\"");
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
                          Container(
                            width: double.infinity,
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
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 200,
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
                              ImageButtonCustom(
                                  size: 50,
                                  onDaba: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            backgroundColor: bgColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            title: Text("Sure to Approve  ?"),
                                            content: Text(
                                                "Click Yes to add ${"${data['name']}".toUpperCase()} in the Final List."),
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
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                          'approvedUser')
                                                      .add(data);
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('user')
                                                      .doc(docId)
                                                      .delete();
                                                },
                                                child: Text("Yes"),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  imagePath: "icons/tick2.png"),
                              ImageButtonCustom(
                                size: 50,
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
                                                  .collection('user')
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

class LoadingText extends StatelessWidget {
  final String txt;
  const LoadingText({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      txt,
      style: TextStyle(
          fontSize: 20, fontFamily: 'Cubano', fontStyle: FontStyle.italic),
    ));
  }
}
