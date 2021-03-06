// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:your_employee/Screens/AddWork/AddWork.dart';
import 'package:your_employee/Screens/ChatPage/ChatPage.dart';
import 'package:your_employee/Screens/FavoritePage/FavoritePage.dart';
import 'package:your_employee/Screens/HomePage/EmpPage.dart';
import 'package:your_employee/Screens/OtherPages/AboutPage.dart';
import 'package:your_employee/Screens/OtherPages/NotificationsPage.dart';
import 'package:your_employee/Screens/OtherPages/SettingPage.dart';
import 'package:your_employee/Screens/ProfilePage/ProfilePage.dart';
import 'package:your_employee/Screens/SearchPage/SearchPage.dart';
import 'package:your_employee/Widgets/NavDrawerWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //This index is for identify pages
  int Sindex = 0;
  PageController _pageController = PageController(initialPage: 0);

  final screen = [
    EmpPage(),
    ChatPage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        color: Colors.white,
      ),
      Icon(
        Icons.chat,
        color: Colors.white,
      ),
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      Icon(
        Icons.favorite,
        color: Colors.white,
      ),
      Icon(
        Icons.person,
        color: Colors.white,
      ),
    ];

    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightBlue),
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddWork()));
                },
                child: Icon(Icons.add, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.blue, // <-- Button color
                  onPrimary: Colors.white, // <-- Splash color
                ),
              ))
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            Sindex = newIndex;
          });
        },
        allowImplicitScrolling: false,
        clipBehavior: Clip.hardEdge,
        children: [
          EmpPage(),
          ChatPage(),
          SearchPage(),
          FavoritePage(),
          ProfilePage()
        ],
      ),

      //The navigation bar
      bottomNavigationBar: BottomNavigationBar(
        //color: Colors.lightBlue,
        //  backgroundColor: Colors.transparent,
        // buttonBackgroundColor: Colors.lightBlue,
        //animationDuration: Duration(milliseconds: 300),
        // height: 50,
        //items: items,
        //index: Sindex,
        //animationCurve: Curves.easeInSine,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.lightBlue,
          ),
        ],
        currentIndex: Sindex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            // For switch the buttom navigation bar and pages at the same time
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
    );
  }

  //The widget for items
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          lt(5, "Profile", Icons.person_outline),
          lt(3, "Search", Icons.search_outlined),
          lt(4, "Favorite", Icons.favorite_outline),
          lt(2, "Chat", Icons.chat_outlined),
          lt(6, "Notification", Icons.notifications_outlined),
          Divider(),
          lt(7, "Settings", Icons.settings_outlined),
          Divider(),
          lt(8, "About", Icons.info_rounded)
        ],
      ),
    );
  }

  //Function for all items in the side bar window
  Widget lt(int id, String ttl, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        title: Text(ttl),
        leading: Icon(icon),
        iconColor: Color(Colors.lightBlue.value),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              Sindex = 0;
              _pageController.animateToPage(0,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else if (id == 2) {
              Sindex = 1;
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else if (id == 3) {
              Sindex = 2;
              _pageController.animateToPage(2,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else if (id == 4) {
              Sindex = 3;
              _pageController.animateToPage(3,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else if (id == 5) {
              Sindex = 4;
              _pageController.animateToPage(4,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else if (id == 6) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            } else if (id == 7) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            } else if (id == 8) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            }
          });
        },
      ),
    );
  }
}
