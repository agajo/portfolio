import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/tab_pages/about_page.dart';
import 'package:portfolio/tab_pages/contact_page.dart';
import 'package:portfolio/tab_pages/works_page.dart';
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
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Oka Ryunoske'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Works',
                  ),
                  Tab(
                    text: 'Contact',
                  ),
                ],
              ),
            ),
            drawer: const MyDrawer(),
            body: TabBarView(
              children: [
                AboutPage(),
                WorksPage(),
                ContactPage(),
              ],
            )),
      ),
    );
  }
}
