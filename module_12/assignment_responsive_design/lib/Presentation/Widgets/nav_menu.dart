import 'package:flutter/material.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: const Color(0xFF1FE592),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: 180,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SKILL UP NOW',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'TAP HERE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.only(left: 50.0, top: 32.0, bottom: 16.0),
            leading: const Icon(
              Icons.movie_outlined,
              size: 32.0, // Larger icon size
            ),
            title: const Text(
              "Episodes",
              style: TextStyle(
                fontSize: 20.0, // Larger text size
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            contentPadding:
            const EdgeInsets.only(left: 50.0, top: 16.0, bottom: 16.0),
            leading: const Icon(
              Icons.live_help_rounded,
              size: 32.0, // Larger icon size
            ),
            title: const Text(
              "About",
              style: TextStyle(
                fontSize: 20.0, // Larger text size
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
