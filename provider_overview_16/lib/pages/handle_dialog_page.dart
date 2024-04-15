import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_16/providers/counter.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({super.key});

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  void initState() {
    super.initState();
    // Dialog는 다른 위젯이 다 완성되고 그 위에 그려져야 하는데, 아래와 같이 하면 이상하다.
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const AlertDialog(content: Text('be careful!'));
    //     });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(content: Text('Be Careful'));
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 이 경우 watch, read 둘다 동작한다.
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('It\'s 3'),
            );
          },
        );
      });
    }

    // 이 경우는 read만 동작한다.
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (context.read<Counter>().counter == 3) {
    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return const AlertDialog(
    //           title: Text('It\'s 3'),
    //         );
    //       },
    //     );
    //   }
    // });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Dialog'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: const TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
