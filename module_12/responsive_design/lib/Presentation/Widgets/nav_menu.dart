import 'package:flutter/material.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Home'),
              tileColor: Colors.grey.shade300,
            ),
            const ListTile(
              title: Text('Chat'),
              tileColor: Colors.green,
            ),
            const ListTile(
              title: Text('Group'),
            ),
            const ListTile(
              title: Text('Notification'),
            ),
            const ListTile(
              title: Text('Fried List'),
            ),
          ],
        ),
      ),
    );
  }
}
