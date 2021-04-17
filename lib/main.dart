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
    final size = WidgetsBinding.instance!.window.physicalSize;
    final aspectRatio = size.width / size.height;
    print(aspectRatio);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
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
          aspectRatio > 2.0 / 3.0
              ? const Padding(
                  padding: EdgeInsets.all(4),
                  child: Simulated.sample(
                    child: MainPage(),
                  ),
                )
              : const MainPage(),
        ],
      ),
    );
  }
}
