import 'package:flutter/material.dart';

import 'section.dart';
import 'tab_page.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabPage(
      children: [
        Section(
          title: Text("作ったアプリ・サービス"),
          child: Text("平均計算機\n"
              "監視しあう会\n"
              "気まぐれタイマー\n"
              "フリックとローマジ\n"
              "縛りカラオケお題マシーン\n"
              "ベズー計算トレーニング\n"
              "パスワード計算機"),
        ),
        Section(
          title: Text("技術記事"),
          child: Text("Flutterの状態管理いろいろ比較 〜グローバル変数StateからBLoCパターンまで〜\n"
              "Flutterのcontextの「お気持ち」を理解する\n"
              "RxJS基礎中の基礎"),
        ),
      ],
    );
  }
}
