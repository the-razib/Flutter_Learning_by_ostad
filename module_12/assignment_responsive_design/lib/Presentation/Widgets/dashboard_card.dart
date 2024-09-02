import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Set border radius to 0 for sharp corners
        side: BorderSide.none, // Remove border
      ),
      color: Colors.white,
      child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 100, bottom: 250),
            child: _buildContent(),
          ),
        ),
        SizedBox(width: 100), // Adjust width for spacing
        Padding(
          padding: const EdgeInsets.only(bottom: 250, right: 56),
          child: _buildButton(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContent(),
        SizedBox(height: 80),
        _buildButton(),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
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
        const SizedBox(height: 24),
        Text(
          'In this course we will go over the basics of using \n Flutter Web for website development. Topics will include\n Responsive Layout, Deploying, Font Changes, Hover\n Functionality, Modals and more.',
          style: TextStyle(height: 2),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        // Add your onPressed logic here
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 96, vertical: 16.0),
        backgroundColor: const Color(0xFF1FE592),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        'Join Course',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
