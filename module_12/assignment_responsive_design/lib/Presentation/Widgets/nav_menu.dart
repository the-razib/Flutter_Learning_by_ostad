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
            const UserAccountsDrawerHeader(
                accountName: Text('SKILL UP NOW'),
                accountEmail: Text('TAP HERE')),
            ListTile(
              leading: const Icon(Icons.movie_outlined),
              title: const Text("Episodes"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.live_help_rounded),
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
