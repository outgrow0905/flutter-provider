import 'package:code_speed/controllers/MenuAppController.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:code_speed/screens/main/main_screen.dart';
import 'package:code_speed/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          // .apply(bodyColor: Colors.white),
          textTheme: const TextTheme(),
          canvasColor: secondaryColor,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            )
          ],
          child: const MainScreen(),
        ));
  }
}
