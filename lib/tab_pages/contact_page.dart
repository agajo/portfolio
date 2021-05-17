import 'package:flutter/material.dart';

import 'section.dart';
import 'tab_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage();
  @override
  Widget build(BuildContext context) {
    return const TabPage(
      children: [
        SizedBox(height: 16),
        Section(
          title: Text("mail"),
          child: Text("masanada@gmail.com"),
        ),
        Section(
          title: Text("twitter"),
          child: Text("@agajo_tech"),
        ),
      ],
    );
  }
}
