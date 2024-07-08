import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: PageActivity(),
    );
  }
}

class PageActivity extends StatelessWidget {
  const PageActivity({super.key});

  // popup message << SnackBer Message >>
  MySnackBer(message, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        titleSpacing: 16,

        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),

        backgroundColor: Colors.green,
        //centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 0.7,
        elevation: 3,

        actions: [
          IconButton(
              onPressed: () {
                MySnackBer('This is search icon', context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                MySnackBer('This is add icon', context);
              },
              icon: Icon(Icons.add_card)),
        ],
      ),

      // <<< Floating action button  >>>
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          MySnackBer('This is a floating button', context);
        },
      ),
      //backgroundColor: Colors.pinkAccent,

      // <<< Bottom Navigation Bar >>>
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined), label: 'Subscriptions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_sharp), label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Home'),
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBer('Home Buttion', context);
          }
          if (index == 1) {
            MySnackBer('Subscription', context);
          }
          if (index == 3) {
            MySnackBer('Notification Button', context);
          }
          if (index == 4) {
            MySnackBer('Notification Button', context);
          }
        },
      ),

      //  <<<Drawer part >>>
      drawer: Drawer(
        child: ListView(
          children:  [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child:UserAccountsDrawerHeader(
                  accountName: Text('Md Razib'),
                  accountEmail: Text('+088 01644556056'),
                  decoration: BoxDecoration(color: Colors.green),
                  currentAccountPicture: Image.asset('images/profilenew1.png'),
                )
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('New Group'),
              onTap: (){
                MySnackBer('This is a New Group Icon', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Contacts'),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Calls'),
              onTap: (){
                MySnackBer('This is a Call Icon', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.nature_people),
              title: Text('People Nearby'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Save Messages'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settigs'),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children:  [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child:UserAccountsDrawerHeader(
                  accountName: Text('Md Razib'),
                  accountEmail: Text('+088 01644556056'),
                  decoration: BoxDecoration(color: Colors.green),
                  currentAccountPicture: Image.asset('images/profilenew1.png'),
                )
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('New Group'),
              onTap: (){
                MySnackBer('This is a New Group Icon', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Contacts'),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Calls'),
              onTap: (){
                MySnackBer('This is a Call Icon', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.nature_people),
              title: Text('People Nearby'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Save Messages'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settigs'),
            ),
          ],
        ),
      ),

      // <<< Body >>>
    );
  }
}
