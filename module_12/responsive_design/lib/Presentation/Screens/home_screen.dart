import 'package:flutter/material.dart';
import 'package:responsive_design/Presentation/Widgets/dashboard_card.dart';
import 'package:responsive_design/Presentation/Widgets/resposive_builder.dart';
import '../Widgets/nav_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResposiveBuilder(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: const NavMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getSummarySection(crossAxisCount: 1, ratio: 2.4),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: const NavMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [_getSummarySection(crossAxisCount: 2, ratio: 2)],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavMenu(),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                            children: [_getSummarySection(crossAxisCount: 3, ratio: 1.5)],
                          ),
              ))
        ],
      ),
    );
  }

  Widget _getSummarySection({required int crossAxisCount , required double ratio}) {
    return GridView(
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        // childAspectRatio: ratio,
        mainAxisExtent: 180
      ),
      children: [
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard()
      ],
    );
  }
}
