import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:phantom/Pages/ProfileScreen.dart';
import 'package:phantom/Pages/pdfscreen.dart';
import 'package:phantom/bardAI/BARDAIchat.dart';
import 'package:phantom/services/notification%20services.dart';
import 'package:phantom/todo%20items/todoscreens/home.dart';

import 'devloperscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    PdfListScreen(),
    BardAIChat(),
    UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();
    // notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      print('Device Token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("PDF All in One"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade100),
              child: Text(
                "PDF ALL in one",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red.shade700,
              ),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.red.shade700,
              ),
              title: Text("User Info Edit"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.yellowAccent,
              ),
              title: Text("Light Theme"),
              onTap: () {
                Get.changeTheme(ThemeData.light());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.black87,
              ),
              title: Text("Dark Theme"),
              onTap: () {
                Get.changeTheme(ThemeData.dark());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.laptop_windows_rounded,
                color: Colors.red.shade700,
              ),
              title: Text("Developed BY"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeveloperScreen(),
                    ));
              },
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: Icon(Icons.exit_to_app_rounded),
                color: Colors.red.shade900,
              ),
              title: Text("Exit"),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.red[900]!,
              gap: 8,
              activeColor: Colors.red[900]!,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.picture_as_pdf_sharp,
                  text: 'PDF',
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'PDF',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
