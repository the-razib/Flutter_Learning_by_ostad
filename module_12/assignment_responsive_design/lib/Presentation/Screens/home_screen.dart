import 'package:flutter/material.dart';
import 'package:responsive_design/Presentation/Widgets/dashboard_card.dart';
import 'package:responsive_design/Presentation/Widgets/nav_menu.dart';
import 'package:responsive_design/Presentation/Widgets/resposive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResposiveBuilder(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  // Mobile Layout
  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'HUMMING \n BIRD.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      drawer: const NavMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getSummarySection(crossAxisCount: 1, ratio: 0.7),
          ],
        ),
      ),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    'HUMMING \n BIRD.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Episodes',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'About',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _getSummarySection(crossAxisCount: 1, ratio: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // Desktop Layout
  Widget _buildDesktopLayout() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:100,top:56),
                  child: Text(
                    'HUMMING \n BIRD.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:56),
                  child: Row(
                    children: [
                      Text(
                        'Episodes',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'About',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // const NavMenu(), // Add the navigation menu on the left
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _getSummarySection(crossAxisCount: 1, ratio: 1.5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Summary Section
  Widget _getSummarySection(
      {required int crossAxisCount, required double ratio}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView(
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: ratio,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        children: const [
          DashboardCard(),
        ],
      ),
    );
  }
}
