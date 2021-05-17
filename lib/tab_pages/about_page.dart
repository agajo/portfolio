import 'package:flutter/material.dart';
import 'package:portfolio/tab_pages/section.dart';
import 'package:portfolio/tab_pages/tab_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage();
  @override
  Widget build(BuildContext context) {
    return const TabPage(
      children: [
        SizedBox(height: 16),
        Section(
          title: Text("name"),
          child: Text("岡 竜之介"),
        ),
        Section(
          title: Text("skills"),
          child: Text("Flutter・Firebase・Rust・JavaScript・TypeScript・Haskell"),
        ),
        Section(
          title: Text("職歴"),
          child: Text("ITベンチャーでの広告運用・SEO(1年半)\n塾講師(3年)"),
        ),
        Section(
          title: Text("資格"),
          child: Text("統計検定 準一級\nTOEIC R&L 770\nAtCoder 水色\n日商簿記 3級"),
        ),
        Section(
          title: Text("強み・性格など"),
          child: Text("自分のスキルアップに余念がない\n多趣味。何かができるようになるのが楽しくてたまらない。\n"
              "MBTIはINTP\n"
              "最近はバク宙ができるようになりました"),
        ),
      ],
    );
  }
}
