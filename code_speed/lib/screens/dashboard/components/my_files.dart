import 'package:code_speed/constants.dart';
import 'package:code_speed/models/my_files.dart';
import 'package:code_speed/responsive.dart';
import 'package:code_speed/screens/dashboard/components/file_info_card.dart';
import 'package:flutter/material.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Files',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add New',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Responsive(
            mobile: FileInfoCardGridView(
              crossAxisCount: size.width < 650 ? 2 : 4,
              childAspectRatio: size.width < 650 ? 1.3 : 1,
            ),
            tablet: const FileInfoCardGridView(),
            desktop: FileInfoCardGridView(
              crossAxisCount: 4,
              childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            ))
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // 스크롤 안의 스크롤이다. 이 스크롤을 비활성화 하기 위한 설정이다.
      physics: const NeverScrollableScrollPhysics(),
      // ListView은 기본적으로 부모로부터 받은 공간을 전부 할당하는데, shrinkWrap을 설정해서 이 ListView가 차지하는만큼만 공간을 할당한다.
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => FilterInfoCard(info: demoMyFiles[index]),
    );
  }
}
