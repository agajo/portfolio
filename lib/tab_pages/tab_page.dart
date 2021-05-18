import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({required this.children});
  final List<Widget> children;

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  late PageController _scrollController;
  Color _bgColor = Colors.blue[100]!;

  @override
  void initState() {
    super.initState();
    _scrollController = PageController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: _bgColor,
          height: double.infinity,
          width: double.infinity,
        ),
        PageView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          children: widget.children,
          onPageChanged: (val) {
            setState(() {
              _bgColor = [
                Colors.blue[100]!,
                Colors.purple[100]!,
                Colors.red[100]!,
                Colors.orange[100]!,
                Colors.yellow[100]!,
                Colors.green[100]!,
              ][val];
            });
          },
        ),
      ],
    );
  }
}
