import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.child,
  });
  final Widget title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PageSize.of(context)!.boxConstraints.maxHeight,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: Theme.of(context).textTheme.headline4!,
              child: title,
            ),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.headline5!,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class PageSize extends InheritedWidget {
  const PageSize({
    required this.boxConstraints,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final BoxConstraints boxConstraints;

  static PageSize? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageSize>();
  }

  @override
  bool updateShouldNotify(PageSize oldWidget) {
    return oldWidget.boxConstraints != boxConstraints;
  }
}
