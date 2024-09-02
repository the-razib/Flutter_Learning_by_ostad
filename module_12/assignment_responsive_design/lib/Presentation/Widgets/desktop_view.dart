import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0), // Add padding around the entire content
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side: Text content
            Expanded(
              flex: 2, // Adjust flex to control the space between text and button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FLUTTER WEB.\nTHE BASICS',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      fontSize: 48,
                      letterSpacing: 1,
                      wordSpacing: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'In this course we will go over the basics of using \n Flutter Web for website development. Topics will include\n Responsive Layout, Deploying, Font Changes, Hover\n Functionality, Modals and more.',
                    style: TextStyle(
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            // Right side: Button
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 12.0),
                    backgroundColor: const Color(0xFF1FE592),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Join Course',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
