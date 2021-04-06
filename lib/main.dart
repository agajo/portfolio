import 'package:flutter/material.dart';
import 'package:portfolio/main_page.dart';
import 'package:portfolio/drawer.dart';
import 'package:portfolio/simulated.dart';
import 'package:portfolio/theme.dart';

void main() {
  runPkg(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Simulated.sample(
        child: MaterialApp(
            theme: myTheme,
            onGenerateTitle: null, // TODO: L10n.of(context).appTitle
            home: const MainPage()),
      ),
    );
  }
}
