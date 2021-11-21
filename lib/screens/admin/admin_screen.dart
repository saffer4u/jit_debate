import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/screens/admin/approval.dart';
import 'package:jit_debate/screens/admin/total_paticipants.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => new _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _pageIndex = 0;
  PageController? _pageController;

  List<Widget> tabPages = [
    Approval(),
    TotalParticipants(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.black87,
      //     elevation: 8,
      //     onPressed: () {
      //       showDialog(
      //           context: context,
      //           builder: (ctx) {
      //             return AlertDialog(
      //               backgroundColor: bgColor,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(12)),
      //               title: Text("Log Out ?"),
      //               actions: [
      //                 TextButton(
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //                   },
      //                   child: Text(
      //                     'Cancel',
      //                   ),
      //                 ),
      //                 TextButton(
      //                   onPressed: () {
      //                     FirebaseAuth.instance.signOut();
      //                     Navigator.popUntil(context, ModalRoute.withName('/'));
      //                   },
      //                   child: Text(
      //                     'Yes',
      //                   ),
      //                 ),
      //               ],
      //             );
      //           });
      //     },
      //     child: Icon(
      //       Icons.logout,
      //     )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: bgColor,
        enableFeedback: true,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        unselectedIconTheme: IconThemeData(size: 24),
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.pending), label: "Pending"),
          BottomNavigationBarItem(
              icon: Icon(Icons.approval), label: "Approved"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            children: tabPages,
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
