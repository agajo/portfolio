import 'package:flutter/material.dart';

import 'section.dart';

class TabPage extends StatelessWidget {
  const TabPage({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => PageSize(
        boxConstraints: constraints,
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: Column(
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
