import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/theme.dart';

import 'drawer.dart';
import 'l10n.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale('ja'), Locale('en'), Locale('zh')],
      localizationsDelegates: [
        L10nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateTitle: (context) => L10n.of(context)!.appTitle,
      theme: myTheme,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Oka Ryunoske'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Profile',
                  ),
                  Tab(
                    text: 'Portfolio',
                  )
                ],
              ),
            ),
            drawer: const MyDrawer(),
            // TODO: このBuilderはいらん
            body: Builder(
              builder: (context) => Center(
                child: Column(
                  children: [
                    Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        child: Text('写真')),
                    Text('yeah連絡先'),
                    Text('スキルセットyeah'),
                    Text('稼働時間'),
                    Text('お金'),
                    Text('資格'),
                    Text('学歴'),
                    Text('職歴'),
                    Text('性格・強み'),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
