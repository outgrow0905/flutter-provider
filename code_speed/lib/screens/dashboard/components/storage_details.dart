import 'package:code_speed/constants.dart';
import 'package:code_speed/screens/dashboard/components/chart.dart';
import 'package:code_speed/screens/dashboard/components/storage_info_card.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            title: 'Documents Files',
            amountOfFiles: '1.3GB',
            svcSrc: 'assets/icons/Documents.svg',
            numOfFiles: 1329,
          ),
          StorageInfoCard(
            title: 'Media Files',
            amountOfFiles: '5.3 GB',
            svcSrc: 'assets/icons/media.svg',
            numOfFiles: 421,
          ),
          StorageInfoCard(
            title: 'Other Files',
            amountOfFiles: '5.3 GB',
            svcSrc: 'assets/icons/folder.svg',
            numOfFiles: 5512,
          ),
          StorageInfoCard(
            title: 'Unknown',
            amountOfFiles: '5.3 GB',
            svcSrc: 'assets/icons/unknown.svg',
            numOfFiles: 421,
          ),
        ],
      ),
    );
  }
}
