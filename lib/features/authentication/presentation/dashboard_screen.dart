import 'package:flutter/material.dart';
import 'package:restaurant_app/features/authentication/presentation/create_account_screen.dart';
import 'package:restaurant_app/features/authentication/presentation/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({required this.index, super.key});

  final int index;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.index);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Create Account"),
              Tab(text: "Login"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CreateAccountScreen(),
                LoginScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
