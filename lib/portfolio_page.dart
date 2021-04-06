import 'package:flutter/material.dart';

import 'drawer.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Oka Ryunoske')),
        drawer: const MyDrawer(),
        body: Center(
          child: Column(
            children: [
              Text('作ったアプリ'),
              Text('技術記事'),
            ],
          ),
        ));
  }
}
