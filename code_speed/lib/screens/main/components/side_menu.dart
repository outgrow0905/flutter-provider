import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: 'Dashboard',
              svcSrc: 'assets/icons/menu_dashboard.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'Task',
              svcSrc: 'assets/icons/menu_task.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'Documents',
              svcSrc: 'assets/icons/menu_doc.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'Store',
              svcSrc: 'assets/icons/menu_store.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'Notification',
              svcSrc: 'assets/icons/menu_notification.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'Profile',
              svcSrc: 'assets/icons/menu_profile.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'Settings',
              svcSrc: 'assets/icons/menu_setting.svg',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svcSrc,
    required this.press,
  });
  final String title;
  final String svcSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: -.0,
      leading: SvgPicture.asset(
        svcSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(title),
    );
  }
}
