// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:code_speed/controllers/MenuAppController.dart';
import 'package:code_speed/responsive.dart';
import 'package:flutter/material.dart';
import 'package:code_speed/screens/dashboard/dashboard_screen.dart';
import 'package:code_speed/screens/main/components/side_menu.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            const Expanded(
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
