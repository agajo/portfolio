import 'package:flutter/material.dart';

import 'drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            body: Center(
              child: Column(
                children: [
                  Container(
                      height: 200,
                      width: 200,
                      color: Colors.yellow,
                      child: Text('写真')),
                  Text('連絡先'),
                  Text('スキルセット'),
                  Text('稼働時間'),
                  Text('お金'),
                  Text('資格'),
                  Text('学歴'),
                  Text('職歴'),
                  Text('性格・強み'),
                ],
              ),
            )),
      ),
    );
  }
}
