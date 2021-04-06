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
      child: Stack(
        alignment: Alignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orange[100]!, Colors.pink[100]!],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Simulated.sample(
              child: MaterialApp(
                  theme: myTheme,
                  onGenerateTitle: null, // TODO: L10n.of(context).appTitle
                  home: const MainPage()),
            ),
          ),
        ],
      ),
    );
  }
}
