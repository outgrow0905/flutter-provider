import 'package:code_speed/responsive.dart';
import 'package:code_speed/screens/dashboard/components/header.dart';
import 'package:code_speed/screens/dashboard/components/my_files.dart';
import 'package:code_speed/screens/dashboard/components/recent_files.dart';
import 'package:code_speed/screens/dashboard/components/storage_details.dart';

import 'package:flutter/material.dart';
import 'package:code_speed/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          height: defaultPadding,
                        ),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    width: defaultPadding,
                  ),
                // 모바일에서는 StorageDetail을 보여주지 않는다.
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
