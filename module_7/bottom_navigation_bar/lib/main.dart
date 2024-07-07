import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(NavigationBer());
}

class NavigationBer extends StatelessWidget {
  const NavigationBer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined),label: 'Subscriptions'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_sharp),label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Home'),
          ],
        ),
      ),
    );
  }
}
